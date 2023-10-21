=begin
Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
`difference_of_squares_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/difference-of-squares` directory.
=end
class Squares
  def initialize(n)
    @n = n
  end
  def square_of_sum
    # count = (1..@n).to_a.reduce(0) {|sum, num| sum + num }
    # count * count
    # (@n**4 + 2 * @n**3 + @n**2) / 4
    (@n * (@n + 1) / 2)**2
  end

  def sum_of_squares
    # (1..@n).to_a.reduce(0) {|sum, num| sum + num * num }
    @n * (@n + 1) * (2 * @n + 1) / 6
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

# puts "******* " + Squares.new(5).square_of_sum.to_s
