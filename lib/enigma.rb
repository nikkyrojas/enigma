require_relative "makeable"
require_relative 'ciphen'
class Enigma < Ciphen
  include Makeable
  attr_reader :encrypt, :decrypt
  def encrypt(message, key = make_key, date = make_date)
    encrypted_msg = encrypt_msg(message, key, date)
    ({
      encryption: encrypted_msg,
      key:        key,
      date:       date
      })
  end

  def decrypt(message, key, date)
     decrypted_msg = decrypt_msg(message, key, date)
     ({
      decryption: decrypted_msg,
      key:        key,
      date:       date
      })
  end

end
