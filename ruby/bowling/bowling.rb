=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end
class Game
  def initialize()
    @score = []
    @frame = 1
    @frame_score = 0;
    @spare = false
  end

  def roll(ball)
    @score << ball
    if @frame == 1
      if @spare == true
        @score += 10 + ball
      end
      @frame_score += ball
      @frame = 2
    end

    if @frame == 2
      if @frame_score + ball == 10
        @spare = true
      else
        @frame_score = 0
        @score += ball
      end
      @frame = 1
    end
  end

  def score
    @score.sum
  end
end

game = Game.new
rolls = [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
rolls.each { |pins| game.roll(pins) }

puts 'something'
