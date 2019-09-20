# Rubinius WebAssembly VM
# Copyright (c) 2019, Laurent Julliard and contributors
# All rights reserved.

require 'rw/ext/tempfile'

module RW::Wat
  class WatFile

    @@wat_compiler = 'wat2wasm'

    attr_reader :wasm_path, :wat_path

    def initialize(wat_path)
      @wat_path = wat_path
    end

    def compile
      @wasm_path = wat_path.gsub(/\.wat$/,'.wasm')
      %x{ #{@@wat_compiler} #{wat_path} -o #{wasm_path} }
    end

    def delete
      File.unlink(@wat_path)
    end

    # Create a tempfile with .wat extension from 
    # an erb template
    def self.assemble(erb_filename, include_paths = nil)
      include_paths ||= ['.', File.expand_path('../../machine', erb_filename)]
      renderer = Renderer.new(include_paths)
      tf = Tempfile.new([File.basename(erb_filename), '.wat'])
      tf.persist! # do not delete tempfile if inspection needed
      tf.write(renderer.render(erb_filename))
      tf.close
      self.new(tf.path)
    end
  end
end
