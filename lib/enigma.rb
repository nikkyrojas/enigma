class Enigma
  attr_reader :encrypted, :decrypted

  def encrypt(message) #key_string = make_key, date_string = make_date)
    @encrypted = ({
      encryption: encrypted_string,
      key:        key_string,
      date:       date_string
      })
    end


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


end
