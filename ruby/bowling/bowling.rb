=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end

class Game
  def initialize
    @frames = []
  end

  def score
    @frames.reduce(0) { |sum, value| sum + value }
  end

  def roll(pins)
    8
  end
end

game = Game.new
puts game.score

