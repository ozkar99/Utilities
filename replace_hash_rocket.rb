#!/bin/env ruby
# Oscar Moreno Garza
# Script to replace hash rocket syntax for new json syntax on hashes.
# from
#   :symbol => obj    
# to
#  symbol: obj
require 'fileutils'

raise ArgumentError, "I need a file" unless ARGV

input = ARGV[0]

input_file = File.open(input, "r")
output_file = File.open("/tmp/#{rand(100000)}.txt", 'w')

input_file.each_line do |line|
  output_file.puts line.gsub(/:([_a-zA-Z]+)\s*=>\s*([\'\":a-zA-Z0-9\[\]\{\}]+)/, '\1: \2')
end

input_file.close
output_file.close

FileUtils.mv(output_file.path, input_file.path)
