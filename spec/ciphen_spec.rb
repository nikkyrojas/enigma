require "./lib/ciphen"
require 'pry'
require 'rspec'
# require "./lib/enigma"
RSpec.describe Ciphen do
  before(:each) do
    # @enigma = Enigma.new
    @ciphen = Ciphen.new
  end

  it "exists" do
    # expect(@enigma).to be_a(Enigma)
    expect(@ciphen).to be_a(Ciphen)
  end

  it "can make 5 digit random keys" do
    expect(@ciphen.make_key).to be_a(String)
  end

  it "can make date (todays date)" do
    expect(@ciphen.make_date).to be_a(String)
  end

  it "can combine and split 5 digit key into 4 keys index" do
    generated_key = @ciphen.make_key
    expect(@ciphen.make_key_index(generated_key).count).to eq(4)
  end

  it "can create offset for keys" do
    @ciphen.make_date
    expect(@ciphen.make_offsets(@ciphen.make_date).count).to eq(4)
  end

  it "has final shift (add offset to key_index)" do
    generated_key = @ciphen.make_key
    key_index = @ciphen.make_key_index(generated_key)
    date = @ciphen.make_date
    offsets = @ciphen.make_offsets(date)
    expect(@ciphen.make_final_shifts(key_index, offsets)).to be_a(Array)
  end

  it "can split message into charactes" do
    expect(@ciphen.split_message("Hello world")).to eq(["h","e","l","l","o"," ","w","o","r","l","d"])
  end

  it "can encrypt a message" do
    expect(@ciphen.encrypt_msg("hello world", "02715", "040895")).to eq("keder ohulw")
  end

  it "can decrypt a message" do
    expect(@ciphen.decrypt_msg("keder ohulw", "02715", "040895")).to eq("hello world")
  end

end
