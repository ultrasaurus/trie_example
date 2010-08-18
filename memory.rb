require 'rubygems'
require 'memprof'
require 'trie_dictionary.rb'
require 'names'

puts "----------------- create"
Memprof.start
d = Dictionary.new
$names.each do |name|
  d.add(name)
end
Memprof.stats
puts "----------------- find"
('A'..'Z').each do |chr| 
  puts "------------ #{chr}"
  d.find(chr)
Memprof.stats
end

Memprof.stop
