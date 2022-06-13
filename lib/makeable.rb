module Makeable

  def make_key
    random_numbers = []
    5.times do
      random_numbers << rand(1..9)
      end
    @random_numbers = random_numbers.join
  end

  def make_date
    Time.now.strftime("%d%m%y")
  end

end
