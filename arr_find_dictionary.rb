class Dictionary
	attr_accessor :words
	
	def initialize
    @words = []
  end
	
	def add(word)
		@words << word
	end	
	
	def include?(word)
	  @words.include?(word)
	end
	
	def find(prefix)
		@words.find_all {|w| w =~ /^#{prefix}/}
	end	
	
end
