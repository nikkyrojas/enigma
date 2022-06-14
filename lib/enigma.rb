require_relative 'encrypt'
require_relative 'ciphen'
class Enigma < Ciphen
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
