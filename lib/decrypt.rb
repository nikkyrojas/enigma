require './lib/enigma'
require './lib/makeable'

enigma = Enigma.new

message_file = File.open(ARGV[0], "r")
message = message_file.read
message_file.close

decrypted_msg = enigma.decrypt(message, ARGV[2], ARGV[3])
message_output = File.open(ARGV[1], "w")
message_output.write(decrypted_msg[:decryption])
message_output.close

ARGV[2] = make_key if ARGV[2] == nil
ARGV[3] = make_date if ARGV[3] == nil


puts "#{ARGV[1]} has been created with the key #{decrypted_msg[:key]} and with the date #{decrypted_msg[:date]}"
