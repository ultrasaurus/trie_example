require 'rubygems'
require 'memprof'
require 'names'
require 'array_dictionary'

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
    puts "-------#{chr}"
    d.find(chr)
    Memprof.stats
  end

Memprof.stats
Memprof.stop
