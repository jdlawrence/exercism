=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end

class Game
  def initialize
    @balls = []
    @total = 0
    @frame = 1
    @strike = false
    @first_roll = true
    @second_roll = false
    @first_ball = 0;
  end

  def score
    @first_roll = true
    @second_roll = false
    @frame = 1

    raise Game::BowlingError.new if @balls.count < 12
    
    @balls.each_with_index do |ball, index|
      # debugger
      if @first_roll && @balls[index] == 10 && !(@frame >= 10)
        @total += @balls[index] + @balls[index + 1] + @balls[index + 2]
        @strike = true
      elsif @frame != 10 && @second_roll && @balls[index - 1] + @balls[index] == 10
        @total += @balls[index] + @balls[index + 1]
      elsif @second_roll && @balls[index -1] + @balls[index] > 10 && @frame < 10
        # debugger
        raise Game::BowlingError.new
      else
        @total += @balls[index]
      end

      if @strike
        @strike = false
        @frame += 1
      elsif @first_roll
        @first_roll = false
        @second_roll = true
      else
        @first_roll = true
        @second_roll = false
        @frame += 1
      end
    end

    @total
  end

  def roll(pins)
    raise Game::BowlingError.new if pins < 0 || pins > 10

    raise Game::BowlingError.new if @second_roll && @first_ball + pins > 10

    if @first_roll && pins == 10
      @strike = true
    end
    @balls.push(pins)

    if @strike
      @strike = false
      @first_ball = 0
      @frame += 1
    elsif @first_roll
      @first_ball = pins
      @first_roll = false
      @second_roll = true
    else
      @first_roll = true
      @first_ball = 0
      @second_roll = false
      @frame += 1
    end
  end

  class BowlingError < StandardError
    def message
      "Invalid game input."
    end
  end
end


