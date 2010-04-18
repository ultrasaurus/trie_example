require '../trie_dictionary"
require '../names'

$data = Dictionary.new
$names.each do |name| 
  $data.add(name)
end
  
