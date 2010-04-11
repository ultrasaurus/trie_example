require 'rubygems'
require 'ruby-prof'
require 'names'
require 'array_dictionary'

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
printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, 0)

