#method that randomly generates a key of 5 digit
#account for leading 0

# splitting it up like so:
#A key: first two digits (02)
# B key: second and third digits (27)
# C key: third and fourth digits (71)
# D key: fourth and fifth digits (15)

#create a date (could be) square the numeric form of date mmddyy then take the last four and use each number to offset each key shift

#creating an array of letters. using the shift to re assign a letter value to the letter iterates through each letter in message (downcase message) account for characters not in character set

#decrption is going in reverse given a date and key
#.strftime('%d/%m/%Y')
require "./lib/enigma"
RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it "exists" do
    expect(@enigma).to be_a(Enigma)
  end

  it "encrypt method has a encrypted string" do
    expect(@enigma.encrypt.encryption).to eq("jcyfu")
  end

  it "encrypt method has a key for encrypted string" do
    expect(@enigma.encrypt.key).to eq("46488")
  end

  it "encrypt method has date used for encrypted string in ddmmyy format" do
    expect(@enigma.encrypt.date).to eq("110622")
  end

  it "creates a hash with the encrypt method" do
    expect(@enigma.encrypt("whatever")).to eq(Hash)
  end

end
