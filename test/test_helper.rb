# Rubinius WebAssembly VM
# Copyright (c) 2019, Laurent Julliard and contributors
# All rights reserved.

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rw'

require 'minitest/autorun'

def build_wasm(erb_path)
  wat_file = RW::Wat::WatFile.assemble(erb_path)
  wat_file.compile
  wat_file.wasm_path
end
