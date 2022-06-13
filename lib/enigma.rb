require_relative 'encrypt'
# require_relative 'makeable'
class Enigma
  include Makeable
  attr_reader :encrypted, :decrypted,

  def encrypt(message, key = make_key, date = make_date)
    # encrypted_msg = Encrypt.encrypted_msg
    @encrypted = ({
      encryption: encrypted_msg,
      key:        key,
      date:       date
      })
  end

  def decrypt(message, key, date)
     # decrypted_msg =
    @decrypted = ({
      decryption: decrypted_msg,
      key:        key,
      date:       date
      })
  end

end
