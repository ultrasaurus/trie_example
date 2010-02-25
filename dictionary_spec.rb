require 'dictionary'

describe Dictionary do
  it "should be able to add words" do
    d = Dictionary.new
    d.add('fish')
    d.include?('fish').should be_true
  end

  it "should find a word from a prefix" do
    d = Dictionary.new
    d.add('fish')
    d.add('fiend')
    d.add('great')
    d.find('fi').sort.should == ['fish', 'fiend'].sort
  end
end
