# file_name -> lower_snake_case
# class name -> UpperCamelCase
require 'pry-byebug'

class SlotMachine
  ITEMS = ['cherry', 'seven', 'bell', 'star', 'joker']
  # index      0        1        2      3        4

  def initialize(reels = [])
    @reels = reels
  end

  def play
    @reels = []
    3.times do
      # get a random element from the ITEMS array
      reel = ITEMS.sample
      # push it to the @reels array
      @reels << reel
    end
    @reels
  end

  def score
    # TODO - Calculate the points!
    # we need to find out if the reels has THREE OF THE SAME!
    # we need to find out if the reels has TWO OF THE SAME
    # 1. uniq on array and check the length
    if @reels.uniq.size == 1
      # 2. if there is only 1 element, they are the same!
      # 2.1 find out which one we have
      item = @reels[0]
      p item #=> 'star'
      # 2.2 calculate the points
      #  index + 1 * 10
      index = ITEMS.find_index(item)
      (index + 1) * 10
    elsif @reels.uniq.size == 2 && @reels.include?('joker')
      # 3. if there is 2 elements, there's a pair!
      #  (index + 1 * 10) / 2
      # if we sort the element in the MIDDLE (index 1)
      # will ALWAYS be the one that repeat!
      item = @reels.sort[1]
      index = ITEMS.find_index(item)
      (index + 1) * 10 / 2
    else
      # p @reels
      # when they are all different!
      0
    end
  end
end
