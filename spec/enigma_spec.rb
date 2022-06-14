require "./lib/enigma"
require './lib/ciphen'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it "exists" do
    expect(@enigma).to be_a(Enigma)
  end

  it "encrypt method creates a hash (of encrypted msg, date, key) with just a message" do
    expect(@enigma.encrypt("hello")).to be_a(Hash)
  end

  it "can encrypt a message with msg and optional argument" do
    expect(@enigma.encrypt("hello world", "02715")).to be_a(Hash)
  end

  it "can encrypt a message with all arguments" do
    expect(@enigma.encrypt_msg("hello world", "02715", "040895")).to eq("keder ohulw")
  end

  it "decrypt method creates a hash (of decrypt msg, date,and key) with encrypt msg key and date" do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
  end

  it "can decrypt a message" do
    expect(@enigma.decrypt_msg("keder ohulw", "02715", "040895")).to eq("hello world")
  end
end
