require 'date'
# require_relative 'makeable'
class Encrypt
  attr_reader :random_numbers,
  # include Makeable
  def initialize
    @random_numbers = []
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
    final_shifts = {
      :A => (key_index[0].to_i + offsets[0].to_i),
      :B => (key_index[1].to_i + offsets[1].to_i),
      :C => (key_index[2].to_i + offsets[2].to_i),
      :D => (key_index[3].to_i + offsets[3].to_i)
    }
  end

  def split_message(message)
    seperate_characters = message.downcase.chars
    seperate_characters.each_slice(4).to_a
  end

  def create_alphabet
    alphabet = ("a".."z").to_a << " "
  end

  def rotate_message(message, final_shifts)
    split_message(message).count #give count of 3

  end

  # def shift_letter_in_group_by_key
  #
  # end


end
