require "./lib/encrypt"
require 'pry'
require 'rspec'
# require "./lib/enigma"
RSpec.describe Encrypt do
  before(:each) do
    # @enigma = Enigma.new
    @encrypt = Encrypt.new
  end

  it "exists" do
    # expect(@enigma).to be_a(Enigma)
    expect(@encrypt).to be_a(Encrypt)
  end

  it "can make 5 digit random keys" do
    expect(@encrypt.make_key).to be_a(String)
  end

  it "can make date (todays date)" do
    expect(@encrypt.make_date).to be_a(String)
  end

  it "can combine and split 5 digit key into 4 keys index" do
    generated_key = @encrypt.make_key
    expect(@encrypt.make_key_index(generated_key).count).to eq(4)
  end

  it "can create offset for keys" do
    @encrypt.make_date
    expect(@encrypt.make_offsets(@encrypt.make_date).count).to eq(4)
  end

  it "has final shift (add offset to key_index)" do
    generated_key = @encrypt.make_key
    key_index = @encrypt.make_key_index(generated_key)
    date = @encrypt.make_date
    offsets = @encrypt.make_offsets(date)
    expect(@encrypt.make_final_shifts(key_index, offsets)).to be_a(Hash)
  end

  it "can split message into charactes of 4" do
    expect(@encrypt.split_message("hello world")).to eq([["h","e","l","l"], ["o"," ","w","o",], ["r","l","d"]])
  end

  it "can encrypt each letter by its final shift key" do
    generated_key = @encrypt.make_key
    key_index = @encrypt.make_key_index(generated_key)
    date = @encrypt.make_date
    offsets = @encrypt.make_offsets(date)
    final_shifts = @encrypt.make_final_shifts(key_index, offsets)
    expect(@encrypt.rotate_message("hello world", final_shifts)).to be_a(String)
  end
end
