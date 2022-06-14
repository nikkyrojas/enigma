require 'date'
# require_relative 'makeable'
class Ciphen
  # include Makeable
attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def make_key
  5.times.map{rand(10)}.join
  end

  def make_date
    Time.now.strftime("%d%m%y")
  end

  def make_key_index(generated_key)
    index = []
    index << generated_key[0..1]
    index << generated_key[1..2]
    index << generated_key[2..3]
    index << generated_key[3..4]
    index
  end

  def make_offsets(date)
    date_squared = (date.to_i * date.to_i).to_s
    last_four = date_squared.split(//).last(4)
    last_four
  end

  def make_final_shifts(key_index, offsets)
      [(key_index[0].to_i + offsets[0].to_i), (key_index[1].to_i + offsets[1].to_i),
      (key_index[2].to_i + offsets[2].to_i),
      (key_index[3].to_i + offsets[3].to_i)]
  end

  def split_message(message)
    seperate_characters = message.downcase.chars
    # seperate_characters.each_slice(4).to_a
  end

  def encrypt_msg(message, key = make_key, date = make_date)
    key_index = make_key_index(key)
    offsets = make_offsets(date)
    final_shifts = make_final_shifts(key_index, offsets)
    shift_count = 0
    ciphened_letters = []
    split_message(message).each do |letter|
      rotated_alphabet = @alphabet.rotate(@alphabet.find_index(letter))
      ciphened_letters << rotated_alphabet.rotate(final_shifts[shift_count])[0]
      shift_count += 1
      if shift_count == 4
        shift_count = 0
      end
    end
      ciphened_letters
  end
end
