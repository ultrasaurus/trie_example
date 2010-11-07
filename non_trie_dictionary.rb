class Dictionary
 def initialize
   @dictionary_ary = []
 end
 def add(word)
   # Only add words if they are composed of characters in the alphabet and are of length 1 at minimum
   return unless word =~ /[a-zA-Z]+/

   @dictionary_ary << word
 end
 def find(word)
   @dictionary_ary.find_all {|w| w =~ /^#{word}/}.to_a
 end
 def include?(word)
   @dictionary_ary.include?(word)
 end
 def words
   @dictionary_ary
 end
 def size
   return @dictionary_ary.size
 end
end

