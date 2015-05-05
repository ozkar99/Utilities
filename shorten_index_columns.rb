#!/bin/usr/env ruby

raise "Need an argument" unless ARGV[0]

File.open(ARGV[0]).each do |line|

 match = line.scan(/INDEX index_(.{25,}) ON/) #indexes with more than 30 chars.

 if match[0]
   line.gsub!("index_#{match[0][0]}", match[0][0]) #remove the "index_" part.
 end

 print line  #print to std-out
end
