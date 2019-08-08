;; This is a simple memory allocator derived
;; from K&R C Language 2nd Edition p 185-189
;; (see https://www.dipmat.univpm.it/~demeio/public/the_c_programming_language_2.pdf)
;;


;; maximum amount of memory the heap can grow
;; NOTE: must be less than the upper WASM memory limit (4GB)
(global $HEAP_MAX_SIZE (mut i32) (i32.const 1073741824)) ;; 1GB

;; current heap size (starts at 0, the first malloc will
;; set it up)
(global $HEAP_SIZE (mut i32) (i32.const 0))

;; Header structure at beginning of each block
;; (this structure is also called a unit and the memory
;; allocation will always happen on a boundary aligned
;; with the most restrictive type of WASM that is to say i64)
;; As the struct below is 8 byte long and i64 is too our
;; unit memory allocation size will be 8 bytes here.
;; 
;; struct {
;;   header *ptr;  /* next block if on free list */ => 4 bytes in WASM
;;   unsigned size /* size of this block */         => 4 bytes in WASM
;; } header;
;;

;; Header accessors
(func $set_hdr_ptr (param $hdr_ptr i32) (param $ptr i32)
  (i32.store (local.get $hdr_ptr) (local.get $ptr))
)

(func $set_hdr_size (param $hdr_ptr i32) (param $size i32)
  (i32.store 
    (i32.add (local.get $hdr_ptr) (i32.const 4))
    (local.get $size)
  )
)

(func $get_hdr_ptr (param $hdr_ptr i32) (result i32)
  (i32.load (local.get $hdr_ptr))
)

(func $get_hdr_size (param $hdr_ptr i32) (result i32)
  (i32.load 
    (i32.add (local.get $hdr_ptr) (i32.const 4))
  )
)

;; (Beginning of) Free list pointer accessor
;; (freep is a static variable declared in data.wat)
(func $get_freep (result i32)
  (i32.load (i32.const 28))
)

(func $set_freep (param $ptr i32)
  (i32.store (i32.const 28) (local.get $ptr))
)

;;-------- Dynamic Memory Allocator Functions -----------

;; malloc: allocate n bytes of memory and return pointer
;; to data block
(func $malloc (param $nbytes i32) (result i32)
  (local $nunits i32)  ;; integer
  (local $prevp i32)   ;; Header *
  (local $p i32)       ;; Header *

  ;; allocate memory by chunk of units
  ;; nunits = (nbytes+sizeof(Header)-1)/sizeof(Header) + 1;
  (local.set $nunits
    (i32.add
      (i32.div_u
        (i32.sub 
          (i32.add (local.get $nbytes) (i32.const 8))
          (i32.const 1)
        )
        (i32.const 8) ;; unit size (= header size)
      )
      (i32.const 1)
    )
  )

  ;; is there a free list yet ?
  ;; if ((prevp = freep) == NULL) { /* no free list yet */
  ;;   base.s.ptr = freep = prevp = &base;
  ;;   base.s.size = 0;
  ;; }
  (local.set $prevp (call $get_freep))
  (if 
    (i32.eqz (local.get $prevp))
    (then
      (local.set $prevp (i32.const 20)) ;; &base is address 20 (see data.wat)
      (call $set_freep (local.get $prevp))
      (call $set_hdr_ptr (local.get $prevp) (local.get $prevp))
      (call $set_hdr_size (local.get $prevp) (i32.const 0))
    )
  )

  ;; scan the free list for a big enough free block
  ;; (first in list is taken)
  ;;
  ;; for (p = prevp->s.ptr;, ; .........) {
  (local.set $p (call $get_hdr_ptr (local.get $prevp)))
  (loop $find_free_block_loop
      ;; if (p->s.size >= nunits) { /* big enough */
    (if 
      (i32.ge_u 
        (call $get_hdr_size (local.get $p))
        (local.get $nunits)
      )
      (then 
        ;; if (p->s.size == nunits) /* exactly */
        (if 
          (i32.eq
            (call $get_hdr_size (local.get $p))
            (local.get $nunits)
          )
          (then
            ;; prevp->s.ptr = p->s.ptr;
            (call $set_hdr_ptr (local.get $prevp) (call $get_hdr_ptr (local.get $p)))
          )
          (else
            ;; p->s.size -= nunits;
            (call $set_hdr_size (local.get $p) 
              (i32.sub
                (call $get_hdr_size (local.get $p))
                (local.get $nunits)
              )
            )
            ;; p += p->s.size;
            (local.set $p 
              (i32.add 
                (local.get $p) 
                (call $get_hdr_size (local.get $p))
              )
            )
            ;; p->s.size = nunits;
            (call $set_hdr_size (local.get $p) (local.get $nunits))
          )
        )
        ;; freep = prevp;
        (call $set_freep (local.get $prevp))
        ;; return (void *)(p+1);
        (return (i32.add (local.get $p) (i32.const 8)))
      )
    )

    ;; if (p == freep) /* wrapped around free list */
    (if
      (i32.eq (local.get $p) (call $get_freep))
 
      ;;if ((p = morecore(nunits)) == NULL)
      (local.set $p (call $morecore (local.get $nunits)))
      (if
        (i32.eqz (local.get $p))
        (then
          ;;return NULL; /* none left */
          (return (i32.const 0))
        )
      )
    )
  
    ;; iterate to next free block
    ;; for (.........;, ; prevp = p, p = p->s.ptr) {
    (local.set $prevp (local.get $p))
    (local.set $p (call $get_hdr_ptr (local.get $p)))

    (br $find_free_block_loop)
  
  ) ;; end loop

  ;; We should never get there but return something
  ;; nonetheless or the wabt compiler will complain 
  ;; that the expected [i32] return value is missing
  (return (i32.const 0))
)

;; ask for more heap memory 
;; return pointer to free space (0 if out of memory)
;;
;; Note : increasing by NALLOC units like K&R does
;; doesn't make much sense in WASM as it will not
;; speed up memory allocation so forget about that
(func $morecore (param $nunits i32) (result i32)
  (local $cp i32)

  ;; ask for more memory (size in bytes = nunits * sizeof(header))
  (local.set $cp (call $sbrk (i32.mul (local.get $nunits) (i32.const 8))))

 ;; no space left: return NULL
  (if
    (i32.eq (local.get $cp) (i32.const -1))
    (then (return (i32.const 0)))
  )

  ;; up = (Header *) cp;
  ;; up->s.size = nu;
  (call $set_hdr_size (local.get $cp) (local.get $nunits))

  ;; free((void *)(up+1));
  (call $free (i32.add (local.get $cp) (i32.const 8)))
  
  ;; return pointer to free space
  (return (call $get_freep)) 
)

;; Return memory block to free list
(func $free (param $ap i32)
  (local $bp i32)
  (local $p i32)

  ;; bp = (Header *)ap - 1; /* point to block header */
  (local.set $bp (i32.sub (local.get $ap) (i32.const 8)))

  ;; scan free list to insert the free block either and 
  ;; merge with previous or next if adjacent
  ;;
  ;; for (p = freep; .....; ......)
  (local.set $p (call $get_freep))
  (block $scan_free_list_block
    (loop $scan_free_list_loop

      ;; for (.......; !(bp > p && bp < p->s.ptr); .........)
      (br_if $scan_free_list_block
        (i32.eq
          (i32.and 
            (i32.gt_u (local.get $bp) (local.get $p))
            (i32.lt_u (local.get $bp) (call $get_hdr_ptr (local.get $p)))
          )
          (i32.const 1)
        )
      )

      ;; if (p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      ;;   break; /* freed block at start or end of arena */
      (br_if $scan_free_list_block
        (i32.and
          (i32.ge_u (local.get $p) (call $get_hdr_ptr (local.get $p)))
          (i32.or 
            (i32.gt_u (local.get $bp) (local.get $p))
            (i32.lt_u (local.get $bp) (call $get_hdr_ptr (local.get $p)))
          )
        )
      )

      ;; if (bp + bp->s.size == p->s.ptr) { /* join to upper nbr */
      (if
        (i32.eq
          (i32.add (local.get $bp) (call $get_hdr_size (local.get $bp)))
          (call $get_hdr_ptr (local.get $p))
        )
        (then
          ;; bp->s.size += p->s.ptr->s.size;
          (call $set_hdr_size
            (local.get $bp)
            (i32.add
              (call $get_hdr_size (local.get $bp))
              (call $get_hdr_size (call $get_hdr_ptr (local.get $p)))
            )
          )
          ;; bp->s.ptr = p->s.ptr->s.ptr;
          (call $set_hdr_ptr
            (local.get $bp)
            (call $get_hdr_ptr (call $get_hdr_ptr (local.get $p)))
          )
        )
        (else
          ;; bp->s.ptr = p->s.ptr;
          (call $set_hdr_ptr (local.get $bp) (call $get_hdr_ptr (local.get $p))
          )
        )
      )

      ;; if (p + p->s.size == bp) { /* join to lower nbr */
      (if
        (i32.eq
          (i32.add (local.get $p) (call $get_hdr_size (local.get $p)))
          (local.get $bp)
        )
        (then
          ;; p->s.size += bp->s.size;
          (call $set_hdr_size (local.get $p)
            (i32.add
              (call $get_hdr_size (local.get $p))
              (call $get_hdr_size (local.get $bp))
            )
          )
          ;; p->s.ptr = bp->s.ptr;
          (call $set_hdr_ptr (local.get $p) (call $get_hdr_ptr (local.get $bp)))
        )
        (else
          ;; p->s.ptr = bp;
          (call $set_hdr_ptr (local.get $p) (local.get $bp))
        )
      )

      ;; freep = p
      (call $set_freep (local.get $p))

      ;; for (.......; .........; p = p->s.ptr)
      (local.set $p (call $get_hdr_ptr (local.get $p)))
      (br $scan_free_list_loop)
    ) ;; end loop
  ) ;; end block

)

;; mimic the sbrk Unix function, requesting n more bytes
;; sbrk(n) returns the address of the allocated block or -1 if it failed
;; srbk(0) returns the current value of the break
;;
;; Note: in WASM we can only grow linear memory by pages (64 KB block)
(func $sbrk (param $n i32) (result i32)
  (local $wasm_mem_size i32)  ;; current wasm memory size (in bytes)
  (local $heap_break i32)     ;; current heap break

  (local $new_heap_size i32)  ;; new heap size (HEAP_SIZE + n)
  (local $new_heap_break i32) ;; new heap break (HEAP + HEAP_SIZE + n)
  (local $more_pages i32)     ;; how many more WASM pages are needed

  ;; return current break if n is zero
  (local.set $heap_break
    (i32.add (global.get $HEAP) (global.get $HEAP_SIZE))
  )
  (if
    (i32.eqz (local.get $n))
    (then (return (local.get $heap_break)))
  )

  ;; check if new heap size is beyond authorized limit
  (local.set $new_heap_size 
    (i32.add (global.get $HEAP_SIZE) (local.get $n))
  )
  (if
    (i32.ge_u (local.get $new_heap_size) (global.get $HEAP_MAX_SIZE))
    (then (return (i32.const -1)))
  )

  ;; We are good, so now check if we need more WASM memory pages
  (local.set $wasm_mem_size
    (i32.mul (memory.size) (i32.const 65536)) ;; page count * 64 KB
  )
  (local.set $new_heap_break
    (i32.add (local.get $heap_break) (local.get $n))
  )

  ;; need to grow ? if so by how many WASM pages ?
  ;; Answer is : ($heap_break - $wasm_mem_size) / 64 KB + 1 
  (if 
    (i32.ge_u (local.get $new_heap_break) (local.get $wasm_mem_size))
    (then 
      (local.set $more_pages
        (i32.add
          (i32.div_u
            (i32.sub (local.get $new_heap_break) (local.get $wasm_mem_size))
            (i32.const 65536)
          )
          (i32.const 1)
        )
      )

      ;; go grow WASM memory by so many pages. Return -1 if it fails
      (if
        (i32.eq (memory.grow (local.get $more_pages)) (i32.const -1))
        (then (return (i32.const -1)))
      )
    )
  )
  
  ;; set new heap size and return that value
  (global.set $HEAP_SIZE (local.get $new_heap_size))

  ;; $heap_break is the address where the new free space starts
  (return (local.get $heap_break)) 
)

