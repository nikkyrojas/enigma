require 'date'
module Makeable
  def make_key
  5.times.map{rand(10)}.join
  end

  def make_date
    Time.now.strftime("%d%m%y")
  end
end
