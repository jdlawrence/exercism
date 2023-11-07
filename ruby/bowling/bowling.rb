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
    # @frame = 10
    @strike = false
    @first_roll = true
    @second_roll = false
    @first_ball = 0;
    @bonus = false;
  end

  def score
    raise Game::BowlingError.new if @balls.count < 12

    if @balls.count < 12
      puts 'balls'
      raise Game::BowlingError.new
    end

    if @frame < 11 || (@twelth_needed && @frame < 12) || @bonus
      puts '#### too short'
      raise Game::BowlingError.new
    end

    @first_roll = true
    @second_roll = false
    @frame = 1


    @balls.each_with_index do |ball, index|
      if @first_roll && @balls[index] == 10 && !(@frame >= 10)
        @total += @balls[index] + @balls[index + 1] + @balls[index + 2]
        @strike = true
      elsif @frame != 10 && @second_roll && @balls[index - 1] + @balls[index] == 10
        @total += @balls[index] + @balls[index + 1]
      elsif @second_roll && @balls[index -1] + @balls[index] > 10 && @frame < 10
        raise Game::BowlingError.new
      else
        @total += @balls[index]
      end

      if @strike && @frame < 10
        @strike = false
        @frame += 1
      elsif @strike
        @strike = false
      elsif @first_roll
        @first_roll = false
        @second_roll = true
      elsif @frame < 10
        @first_roll = true
        @second_roll = false
        @frame += 1
      else
        @first_roll = true
        @second_roll = false
      end
    end

    @total
  end

  def roll(pins)
    raise Game::BowlingError.new if pins < 0 || pins > 10 || @frame > 11

    if @second_roll && !@strike && (@first_ball + pins > 10)
      puts 'too much in frame'
      raise Game::BowlingError.new 
    end 

    if @first_roll && pins == 10
      @strike = true
    end
    @balls.push(pins)

    if @frame >= 10
      if !(@first_roll || @second_roll || @bonus)
        puts '************'
        puts pins
        raise Game::BowlingError.new
      elsif @strike
        if @frame == 10
          # @strike = false
          @first_roll = true
          @second_roll = false
          @first_ball = 0
          @frame += 1
          @twelth_needed = true
        elsif @first_roll
          @first_roll = false
          @second_roll = true
          @first_ball = pins
        else
          if @first_ball != 10 && (@first_ball + pins > 10)
            puts 'too much in 10th'
            raise Game::BowlingError.new
          end
          @second_roll = false
          @strike = false
          @frame += 1
          @twelth_needed = false
        end
      elsif @second_roll && @first_ball + pins >= 10
        @second_roll = false
        @bonus = true
        @frame += 1
      elsif @bonus
        @bonus = false
      elsif @first_roll
        @first_roll = false
        @second_roll = true 
        @first_ball = pins
      else 
        @second_roll = false
        @frame += 1
      end
    elsif @strike
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


