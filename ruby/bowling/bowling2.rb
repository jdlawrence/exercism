=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end

class Game
  def initialize
    @frames = []
    @frame = 0
    @spare = false
    @strike = false
    @second_ball = false
    @strike_counter = []
  end

  # [
  #   1
  # ]

  # [
  #   [10],
  #   [10],
  #   [10],
  #   [5, 3],
  #   [0, 0]
  #   [0, 0]
  # ]
  def score
    @frames.sum
  end

  def roll(pins)
    # debugger
    @frame += 1 if !@second_ball

    # Account for from previous frames
    @strike_counter.each_with_index do |strike, index|
      if strike == 2
        @frames[-1] += pins unless @frame == 11
        @strike_counter[index] -= 1
      else
        @frames[-2] += pins unless @frame == 11
        @strike_counter[index] -= 1
      end
    end

    # Remove strikes that are done
    @strike_counter.delete_if { |strike| strike == 0 }

    if !@second_ball && pins === 10
      @frames.push(pins)
      @strike_counter.push(2)
    else
      if @spare
        @frames[-1] += pins unless @frame == 11
        @spare = false
      elsif @second_ball && @frames[-1] + pins == 10
        @spare = true
      end
      @frames.push(pins)
      @second_ball = !@second_ball
    end
  end
end


