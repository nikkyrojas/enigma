require './lib/enigma'
require './lib/makeable'
require 'pry'
include Makeable

enigma = Enigma.new

message_file = File.open(ARGV[0], "r")

message = message_file.read
message_file.close
encrypted_msg = enigma.encrypt(message)
message_output = File.open(ARGV[1], "w")
message_output.write(encrypted_msg[:encryption])
message_output.close

puts "#{ARGV[1]} has been created with the key #{encrypted_msg[:key]} and with the date #{encrypted_msg[:date]}"
