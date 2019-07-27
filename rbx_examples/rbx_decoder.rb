#!/home/ljulliard/misc/applications/rubinius/rubinius/runtime/bin/ruby

#
# Load a file and decode method in class
#
# 
load ARGV[0]
class_name = ARGV[1]
method_name = ARGV[2]

klass = Object.const_get(class_name)
compiled_code = klass.instance_method(method_name).executable

p compiled_code.iseq.opcodes
puts compiled_code.decode
