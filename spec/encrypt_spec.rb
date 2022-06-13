require "./lib/encrypt"
require "./lib/enigma"
RSpec.describe Encrypt do
  before(:each) do
    @enigma = Enigma.new
    @encrypt = Encrypt.new
  end

  it "exists" do
    expect(@enigma).to be_a(Enigma)
    expect(@encrypt).to be_a(Encrypt)
  end

  it "can combine and split 5 digit key into 4 keys" do
    expect(@encrypt.make_key_sets.count).to eq(4)
  end

  xit "can create offset for keys" do

  end

  it "can split message into individual letters" do
    expect(@encrypt.split_message).to eq(["w","h","a","t","e","v","e","r"])
  end

  it "can group every 4 letters into an array " do
    expect(@encrypt.split_message).to eq(["w","h","a","t"],["e","v","e","r"]) #first group will be shifted by A and second shifted by B
  end

end
