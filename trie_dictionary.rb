require 'set'

class Dictionary
  def initialize
    @words = Hash.new
  end

  def words(subtree = @words, prefix="")
    result = []
    #puts "words #{subtree.inspect} #{result.inspect} #{prefix}"
    return [] if @words.empty?
    return [ prefix ] if subtree.empty? 
    subtree.each do |key, value|
      result += words(value, prefix + key)
    end
    #puts "result = #{result.inspect}"
    result
  end

  def add(word, subtree=@words)
    #puts "add #{word}"
    return if word.empty?
    first = word[0,1]
    if subtree[first].nil?
      subtree[first] = Hash.new
    end
    add(word[1..-1], subtree[first])
  end

  def include?(word, subtree = @words)
    return true if word.empty? 
    first = word[0,1]
    if subtree[first].nil?
      false
    else
      include?(word[1..-1], subtree[first])
    end
  end

  def find(orig_prefix, subtree = @words, prefix=nil)
    #puts "find #{orig_prefix}, #{prefix}, #{subtree.inspect}" 
    prefix = orig_prefix if prefix.nil?
    return [] if @words.empty?
    return words if orig_prefix.empty?

    first = prefix[0,1]
    if prefix.empty?
      return words(subtree, orig_prefix)
    else
      find(orig_prefix, subtree[first], prefix[1..-1])
    end

  end
end

