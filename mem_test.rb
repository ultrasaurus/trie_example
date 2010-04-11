require 'rubygems'
require 'memprof'
require 'names'

type = ARGV[0]
type = "trie" if type.nil?
file_name = "#{type}_dictionary"
puts "Memory test for: #{file_name}.rb"

require file_name 

puts "-------------- build dictionary"
Memprof.start
d = Dictionary.new
$names.each do |name| 
  d.add(name)
end
  
Memprof.stats
puts "-------------- find"
# Profile the code
  ('a'..'z').each do |chr| 
    d.find(chr)
  end

Memprof.stats
Memprof.stop
