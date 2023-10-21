=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end
class Matrix
  def initialize(input)
    @input = input
  end

  def rows
    all_rows = @input.split("\n")
    result = []
    all_rows.each do |row|
      single_row = row.split(" ")
      result.push(single_row.map do |val|
        val.to_i
      end
      )
    end
    result
  end

  def columns
    result = []
    num_rows = self.rows.count
    num_cols = self.rows[0].length

    for r in 1..(num_cols) do
      col = []
      for c in 1..(num_rows) do
        col.push(self.rows[c - 1][r - 1])
      end
      result.push(col)
    end
    result
  end
end
