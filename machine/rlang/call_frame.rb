# ===================================================
# Call Frame class
# ===================================================

class CallFrame

    def self.init(ip, regs_count, locals_count)
      stack_size = I32.size * 4 + I64.size * regs_count + I64.size * locals_count + I32.size + I64.size * 32
      # Call frame structure
      #  prev_cf: pointer to previous call frame
      #  ip: current instruction pointer
      #  regs_count : number of registers in the call frame
      #  locals_count: number of locals in the call frame
      #  stk_idx: index of the first free slot in the local Ruby stack
      #  stk: Local Ruby stack to use from within the call frame
      #       Fixed size for now (32 Ruby objects, 64 bit each).
      #       TODO: Should probably be managed dynamically in a specific
      #       memory zone
      self.stk_idx = -1
      Stack.allocate(stack_size)
    end

    def self.prev_cf(cf)
      Memory[cf]
    end

    def self.prev_cf_set(cf,value)
      Memory[cf] = value
    end

    def self.ip(cf)
      Memory[cf - 4]
    end

    def self.ip_set(cf,ip)
      Memory[cf - 4] = ip
    end

    def self.regs_count(cf)
      Memory[cf - 8]
    end

    def self.regs_count_set(cf,count)
      Memory[cf - 8] = count
    end

    def self.locals_count(cf)
      Memory[cf - 12]
    end

    def self.locals_count_set(cf,count)
      Memory[cf - 12] = count
    end

    def self.reg(idx)
      Memory[cf - 16 - idx * I64.size]
    end

    def self.reg_set(cf,idx, value)
      Memory[cf - 16 - idx * I64.size] = value
    end

    def self.local(cf,idx)
      Memory[cf - 16 - regs_count * I64.size - idx * I64.size]
    end

    def self.local_set(cf, idx, value)
      Memory[cf - 16 - regs_count * I64.size - idx * I64.size] = value
    end

    def self.stk_idx(cf)
      Memory[cf - 16 - (regs_count + local_count) * I64.size]
    end

    def self.stk_idx_set(cf,value)
      Memory[cf - 16 - (regs_count + local_count) * I64.size] = value
    end

    def self.stk(cf,idx)
      Memory[cf - 16 - (regs_count + local_count) * I64.size - I32.size - I64.size * idx]
    end

    def self.stk_set(cf,idx,value)
      Memory[cf - 16 - (regs_count + local_count) * I64.size - I32.size - I64.size * idx] = value
    end

    def self.ip_next(cf)
      increment = InstructionData.size(self.opcode(cf))
      self.ip_incr(cf,increment)
    end

    def self.ip_incr(cf,increment)
      self.ip_set(cf, self.ip + increment)
    end


    # bytecode (ip + offset) is pointing at
    # TODO: right now to make things simpler  each bytecode is 
    # stored in a 32 bit word. This will likely change once the
    # real bytecode leader is in place
    def self.bytecode_at_ip(cf, offset)
      Memory[Global[:$OPCODES] + (self.ip(cf) + offset) * 4]
    end

    # access nth argument in bytecode
    def self.arg(cf,n)
      bytecode_at_ip(cf, n)
    end

    # instruction opcode ip is curently pointing at
    def self.opcode
      bytecode_at_ip(cf, 0)
    end

    def self.stk_idx_incr(cf)
      self.stk_idx_set(cf, self.stk_idx(cf) + 1)
    end

    def self.stack_push(value)
      param :value, type: I64
      stk_idx_incr(cf)
      self.stk_set(cf,idx,value)
    end

    def self.stack_top(cf)
      self.stk(cf, self.stk_idx(cf))
    end

end
