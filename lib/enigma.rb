class Enigma
  attr_reader :encrypt, :decrypt, :encrypted, :decrypted

  def make_key
    random_numbers = []
    5.times do
      random_numbers << rand(1..9)
      end
    random_numbers.join
  end

  def make_date
    Time.now.strftime("%d%m%y")
  end

  def 

  def encrypted_string
  end

  def encrypt(message, key = make_key, date = make_date)
    @encrypted = ({
      encryption: encrypted_string,
      key:        key,
      date:       date
      })
  end


end
