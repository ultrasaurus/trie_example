class Dictionary

	def initialize
		@dict = []
	end

	def words
		@dict	
	end

	def add(w)
		@dict << w
	end

	def sort
	end

	def include?(w)
		@dict.member?(w)
	end

	def find(w)
		@dict.select { |a| a =~ /^#{w}/o }
	end

end
