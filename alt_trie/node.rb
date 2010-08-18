

class Node
  
    def initialize(char)
      @payload = char
      @linkednodes = []
    end  
    
    def addnode(node)
      @linkednodes.push(node)
      node
    end
    
    def getnodechild(char)
      puts "checking for " + char + " in" + @linkednodes.to_s
      @linkednodes.find { |n| n.payload == char }   
    end    
    
    def links()
      @linkednodes
    end
    
    def payload()
      @payload
    end  
    
    def to_s()
      "payload:" + @payload + " linkednodes:" + @linkednodes.to_s
    end
    
end
