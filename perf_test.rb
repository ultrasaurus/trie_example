require 'rubygems'
require 'ruby-prof'
require 'names'

#type = ARGV[0]
#type = "trie" if type.nil?
#file_name = "#{type}_dictionary"
#puts "Performance test for: #{file_name}.rb"
#require file_name
require "trie_dictionary"

d = Dictionary.new
puts "---------------------- #{$names.length}"
$names.each do |name| 
  d.add(name)
end
  
# Profile the code
result = RubyProf.profile do
  begin
  ('A'..'Z').each do |chr|
    d.find(chr)
  end
 # ('aaaa'..'zzzz').each do |chr| 
 #   d.find(chr)
 # end
  rescue
    puts "exception!"
  end
end

# Print a graph profile to text
printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, 0)

