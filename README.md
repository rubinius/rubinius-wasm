# Rubinius WebAssembly (Rw)

A WebAssembly implementation of the Rubinius instruction set.

The Rubinius instruction set is intended to be a rich, semantically complete set of operations that enables encoding all relevant language semantics to provide analysis and optimization without needing to recreate type information.

By implementing the Rubinius instructions set directly in WebAssembly, all the Rubinius tools, including compiler toolchain and language analysis tools, are immediately available on any conforming WebAssembly platform.

## Status
This is very preliminary, non-functional implemenentation right now. What has been implemented so far:
* A first version of the interpreter loop
* All placeholders functions for the bytecode is there (both interpreter and instruction functions) as well as the data describing each instruction
* Some instructions needed to run an iterative version of the Fibonacci function are already implemented
* The iterative fib code is handcoded for now and it runs for real (see Running below)
* There is also a dynamic memory allocator (malloc.wat) implemented and tested but not yet in use

## Installing
* git clone the repository
* Install rust and cargo (we need them to run the Wasmer WASM runtime. Aprt from being fast Wasmer has handy APIs that allows to drive the runtime from a number of languages including Ruby. We use it to drive the VM test)
* Compile and install the [Wabt tools](https://github.com/WebAssembly/wabt). For now we use wat2wasm to compile the WAT file (WebAssembly source file) into a WASMbinary and wasm-interp to run the Ruby WASM VM
* Then run `bundle install` to install all gems needed (you can either use rubinius Ruby or MRI Ruby 2.6.3)

## Running
Right now the only code you can run is the iterative fib (fibi) code hardcoded in the `wasm_vm/src/data.wat` file (see line 1385 to 1470)

To run the fibi function:
```
$ rake build
$ cd test/browser
$ ruby ./server.rb
```

then launch a WASM enabled browser (I use Chrome but Firefox, Safari or IE should work too) and visit http://localhost:8080/. Chose the value of n and then click on the `Run` button. The corresponding Fibonacci value should appear right below and in the browser console too.

To run the Ruby WASM VM from the command line, edit the wasm_vm/src/main.wat and remove the `;;` comment from the line `;; (start $main)`, optionally change the value of n (16 by default) in the $main function right below, then
```
$ rake build
$ rake run
```

You should see a full trace of the WASM instructions being executed and a final log line like this one:
```
called host host.print(i64:987) =>
```
and indeed fib(16) is 987 :-)

## Development
The Rw code is in `wasm_vm/src`. The individual WAT files are assambled and compiled through a rake recipe. If you modify any of the WAT files you'll need to build the Rw.wasm again with `rake build`.

```
$ rake assemble # put the individual WAT files together according to the `wasm_vm/rw.erb` template
$ rake compile  # compile the assembled WAT build/src/rw.wat into buid/bin/rw.wasm
$ rake build    # assemble + compile
$ rake run      # run the fibi function from the command line
$ rake test     # run all tests (requires wasmer - see above)
```

## Code of Conduct

Participation in the Rubinius project is governed by the Rubinius [Code of Conduct](https://rubinius.com/code-of-conduct/).

## License

All source code in this repository is subject to the terms of the Mozilla Public License, version 2.0 unless stated otherwise. A copy of this license can be found the file "LICENSE" or at <https://www.mozilla.org/MPL/2.0/>.

## Issues & Support

Please [file tickets](http://github.com/rubinius/rubinius/issues) for bugs or problems.

For additional help, visit the [Rubinius Gitter chat room](https://gitter.im/rubinius/rubinius).

## Contributing

The Rubinius team welcomes contributions. For more information, read the [contributing](https://github.com/rubinius/rubinius/blob/master/.github/contributing.md) file.
