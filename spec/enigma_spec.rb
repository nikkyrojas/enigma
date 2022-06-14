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
require './lib/makeable'
require './lib/ciphen'
# require_relative 'encrypt'
require 'rspec'
require 'pry'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it "exists" do
    expect(@enigma).to be_a(Enigma)
  end

  it "creates a hash with the encrypt method" do
    expect(@enigma.encrypt("hello")).to be_a(Hash)
  end

  it "creates a hash with the decrypt method" do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
  end

  it "can encrypt a message" do
    expect(@enigma.encrypt_msg("hello world", "02715", "040895")).to eq("keder ohulw")
  end

  it "text" do
    expect(@enigma.encrypt("hello world")).to be_a(Hash)
  end

  it "can decrypt a message" do
    expect(@enigma.decrypt_msg("keder ohulw", "02715", "040895")).to eq("hello world")
  end

end
