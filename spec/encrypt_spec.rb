require "./lib/encrypt"
require 'pry'
require 'rspec'
# require "./lib/enigma"
RSpec.describe Encrypt do
  before(:each) do
    # @enigma = Enigma.new
    @encrypt = Encrypt.new
  end
