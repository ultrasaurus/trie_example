require 'trie_dictionary'

describe Dictionary do
  it "should be empty when created" do
    d = Dictionary.new
    d.words.should == []
  end

  it "should report its contents" do 
    d = Dictionary.new
    d.add("fish")
    puts d.words
    d.add("foul")
    d.words.sort.should == ["fish", "foul"].sort
  end

  it "should report only one of each entry" do 
    d = Dictionary.new
    d.add("fish")
    d.add("fish")
    d.words.should == ["fish"]
  end

  it "should report its contents when there are many" do 
    d = Dictionary.new
    d.add("fish")
    d.add("foul")
    d.add("freak")
    d.add("foo")
    d.words.sort.should == ["fish", "foul", "freak", "foo"].sort
  end

  it "should not include a word in an empty dictionary" do
    d = Dictionary.new
    d.include?('fish').should be_false
  end

  it "should be able to add words" do
    d = Dictionary.new
    d.add('fish')
    d.include?('fish').should be_true
  end

  it "should not find word in empty dictionary" do
    d = Dictionary.new
    d.find('fi').should == []
  end

  it "should find multiple matches from a prefix" do
    d = Dictionary.new
    d.add('fish')
    d.add('fiend')
    d.add('great')
    d.find('').sort.should == ['fish', 'fiend', 'great'].sort
  end

  it "should find a word from a prefix" do
    d = Dictionary.new
    d.add('fish')
    d.add('fiend')
    d.add('great')
    d.find('gr').should == ['great']
  end

  it "should find multiple matches from a prefix" do
    d = Dictionary.new
    d.add('fish')
    d.add('fiend')
    d.add('great')
    d.find('fi').sort.should == ['fish', 'fiend'].sort
  end




end
