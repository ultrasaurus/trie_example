require 'set'

class Dictionary
  def initialize
    @words = Set.new
  end

  def add(word)
    @words << word
  end

  def include?(word)
    @words.include?(word)
  end

  def find(prefix)
    @words.select do |word|
      word[0,prefix.size] == prefix
    end
  end
end
