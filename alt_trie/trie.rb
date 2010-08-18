require 'node'

class Trie
  
  def initialize()
    # @contents = [] 
    @rootnode = Node.new("") 
  end  
  
  def add(item)
    # @contents.push(item)
    puts "adding " + item
    @node = @rootnode
    for char in item.split("")
      unless @node.getnodechild(char).nil?
        puts "found " + char + ", descending"
        @node = @node.getnodechild(char)
      else 
        puts "did not find " + char + " so adding and descending"
        @node = @node.addnode(Node.new(char))
        puts @node
      end
    end    
  end   
  
  def find(item)
    puts "LOOKING FOR: " + item
    @node = @rootnode
    retval = true
    for char in item.split("")
      unless @node.getnodechild(char).nil?
        puts "found " + char + ", descending"
        @node = @node.getnodechild(char)
      else
        retval = false
      end
    end
    puts "FOUND: " + item if retval
    puts "DID NOT FIND: " + item unless retval
    retval    
  end
  
end