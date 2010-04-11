class Dictionary
  def initialize
    @tree = {}
  end

  def add(word,subtree=@tree)
    if word.size == 0
      subtree[:terminal] = true
    else
      first_char = word[0]
      rest = word[1..-1]
      subtree[first_char] ||= {}
      add(rest, subtree[first_char])
    end
  end

  def include?(word)
    subtree = walk(word)
    if subtree and subtree[:terminal]
      return true
    else
      return false
    end
  end

  def find(prefix)
    subtree = walk(prefix)
    return [] unless subtree
    return words(subtree, prefix)
  end

  def words(subtree = @tree, prefix="", words=[] )
    subtree.each do |key, next_subtree|
      if key == :terminal
        words << prefix
      else
        words(next_subtree, prefix + key.chr, words)
      end
    end
    return words
  end

  private

  def walk(word)
    subtree = @tree
    word.each_byte do |byte|
      subtree = subtree[byte]
      return false if subtree.nil?
    end
    return subtree
  end

end
