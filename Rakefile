# Rubinius WebAssembly VM
# Copyright (c) 2019, Laurent Julliard and contributors
# All rights reserved.

#require "bundler/gem_tasks" # we are not building a gem right now
require "rake/testtask"
require 'erb'
require 'fileutils'

WAT_DIR = './machine'
BUILD_DIR = File.join('./build')
ERB_FILE = File.join(BUILD_DIR, 'rw.erb')
WAT_VM_FILE = File.join(BUILD_DIR, 'src', 'rw.wat')
WASM_VM_FILE = File.join(BUILD_DIR, 'bin', 'rw.wasm')

# ERB render method used in rbx.erb
def render(filename)
  File.open(File.join(WAT_DIR, filename),'r').read
end

# =========== RAKE TASKS ================

desc 'Assemble WAT files'
task :assemble => [:create_build_dir] do
  renderer = ERB.new(File.open(ERB_FILE,'r').read)
  File.open(WAT_VM_FILE,'w') { |fh| fh.write(renderer.result(binding))}
end

desc 'Compile VM WAT file to WASM'
task :compile => [:assemble] do
  sh "wat2wasm #{WAT_VM_FILE} -o #{WASM_VM_FILE}"
end

desc 'Build Rubinius WASM VM binary'
task :build => [:assemble, :compile] do
end

desc 'Run rbx WASM'
task :run => [:build] do
  sh "wasm-interp -t --host-print #{WASM_VM_FILE}"
end

desc 'Clean build tree'
task :clean do
  FileUtils.rm_rf(WAT_VM_FILE, WASM_VM_FILE)
end

desc 'Create build tree'
task :create_build_dir do
  FileUtils.mkdir_p(File.join('./build', 'src'))
  FileUtils.mkdir_p(File.join('./build', 'bin'))
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test
