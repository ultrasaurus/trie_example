class Dictionary
  
  def initialize
    @trie = {}
  end

  def add(word)
    return false if !word.kind_of?(String) || word == ''
    array = word.split('').collect {|char| char.to_sym}
    _add(array, @trie)
  end

  def _add(array, trie)
    symbol = array[0]
    length = array.length
    if trie[symbol] == nil
      if length == 1
        trie[symbol] = :END
      else
        trie[symbol] = array_to_trie(array[1..-1], {})
      end
    else
      if length == 1
        trie[symbol][:END] = :END
      else
        trie[symbol] = {:END=>:END} if trie[symbol] == :END
        _add(array[1..-1], trie[symbol])
      end
    end
  end

  def array_to_trie(array, trie)
    trie[array[0]] = (array.length == 1 ? :END : array_to_trie(array[1..-1], {}))
    trie
  end

  def find(prefix)
    words(_find(split(prefix), @trie)).collect {|suffix| prefix + suffix}
  end

  def _find(array, trie)
    return trie if array == []
    sub_trie = trie[array[0]]
    return {} if sub_trie.nil?
    return _find(array[1..-1], sub_trie)
  end

  def include?(word)
    _include?(split(word), @trie)
  end


  def _include?(array, trie)
    return (trie == :END || trie.keys.include?(:END)) if array == []
    sub_trie = trie[array[0]]
    return !sub_trie.nil? && _include?(array[1..-1], sub_trie)
  end

  def words(trie=@trie)
    return [] if trie == {}
    traverse(trie)
  end

  def traverse(trie, current_word = '')
    trie.keys.inject([]) do |accumulator, key|
      if key == :END
        accumulator << current_word
      elsif trie[key] == :END
        accumulator << current_word + key.to_s
      else
        accumulator += traverse(trie[key], current_word + key.to_s)
      end
    end
  end

  def split(string)
    string.split('').collect {|char| char.to_sym}
  end

  private :_add, :array_to_trie, :_find, :_include?, :traverse, :split

end