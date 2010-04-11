require 'rubygems'
require 'ruby-prof'
require 'names'

type = ARGV[0]
type = "trie" if type.nil?
file_name = "#{type}_dictionary"
puts "Performance test for: #{file_name}.rb"

require file_name

d = Dictionary.new
$names.each do |name| 
  d.add(name)
end
  
# Profile the code
result = RubyProf.profile do
  ('a'..'z').each do |chr| 
    d.find(chr)
  end
  
end

# Print a graph profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT, 0)

