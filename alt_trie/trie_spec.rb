require 'trie'

describe Trie do
  before do
    @t = Trie.new
  end
  
  it "should report a correct find" do 
    @t.add("fish")
    @t.add("fad")
    @t.add("girl")
    @t.find("fish").should == true
    @t.find("dog").should == false    
  end
  
end  