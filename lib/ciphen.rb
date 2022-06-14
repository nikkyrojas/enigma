require_relative 'makeable'
class Ciphen
  include Makeable

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def split_message(message)
    seperate_characters = message.downcase.chars
  end

  def encrypt_msg(message, key = make_key, date = make_date)
    key_index = make_key_index(key)
    offsets = make_offsets(date)
    final_shifts = make_final_shifts(key_index, offsets)
    shift_count = 0
    ciphened_letters = []
    split_message(message).each do |letter|
      if @alphabet.include?(letter)
        rotated_alphabet = @alphabet.rotate(@alphabet.find_index(letter))
        ciphened_letters << rotated_alphabet.rotate(final_shifts[shift_count])[0]
        shift_count += 1
          if shift_count == 4
            shift_count = 0
          end
      else
        ciphened_letters << letter
      end
    end
      ciphened_letters.join
  end

  def decrypt_msg(message, key, date)
    key_index = make_key_index(key)
    offsets = make_offsets(date)
    final_shifts = make_final_shifts(key_index, offsets)
    shift_count = 0
    unciphened_letters = []
    split_message(message).each do |letter|
      if @alphabet.include?(letter)
        rotated_alphabet = @alphabet.rotate(@alphabet.find_index(letter))
        unciphened_letters << rotated_alphabet.rotate(-final_shifts[shift_count])[0]
        shift_count += 1
        if shift_count == 4
          shift_count = 0
        end
      else
        unciphened_letters << letter
      end
    end
      unciphened_letters.join
  end
end
