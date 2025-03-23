=begin
Write your code for the 'Grains' exercise in this file. Make the tests in
`grains_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grains` directory.
=end
class Grains
  def self.square(board_size)
    raise ArgumentError, "board size must be between 1 and 64" if board_size <= 0 || board_size > 64
    2 ** (board_size - 1)
  end

  def self.total
    2 ** 64 - 1
  end
end
