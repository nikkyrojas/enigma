require_relative 'enigma'
require_relative 'makeable'
class Encrypt
  include Makeable

  def make_key_sets
    convert_to_i = random_numbers.to_i
    split_numbers = convert_to_i.digits
    a_key_join = split_numbers[0..1].join
    b_key_join = split_numbers[1..2].join
    c_key_join = split_numbers[2..3].join
    d_key_join = split_numbers[3..4].join
  end

  def make_keys_shifts
    key_shifts = {
    :a_key => a_key_join,
    :b_key => b_key_join,
    :c_key => c_key_join,
    :d_key => d_key_join
  }
  end

  def offsets(date)
    date_squared = (date.to_i * date.to_i).to_s
    last_four = date_squared.split(//).last(4)
      offset = {
      :a => last_four[0],
      :b => last_four[1],
      :c => last_four[2],
      :d => last_four[3]
     }
  end

  def final_shifts
    {
    :A => offset.a + key_shifts.a_key,
    :B => offset.b + key_shifts.b_key,
    :C => offset.c + key_shifts.c_key,
    :D => offset.d + key_shifts.d_key
   }
  end

  def split_message(message)
    split_message = message.downcase.chars
  end

  def group_split_message_by_four_characters
    message_groups = split_message.each_slice(4).to_a
    #makes arrays of 4 characters for each shift group (ABCD)
  end

  def assign_character_an_index
    shift_groups = {}

  end

  def create_alphabet
    alphabet = ("a".."z").to_a << " "

  end

  def shift_letter_in_group_by_key

  end


end
