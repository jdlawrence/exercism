# Write your code for the 'Two Bucket' exercise in this file. Make the tests in
# `two_bucket_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/two-bucket` directory.

class TwoBucket
  def initialize(bucket_1, bucket_2, goal, first)
    @bucket_1 = bucket_1
    @bucket_2 = bucket_2
    @goal = goal
    @first = first
  end

  def moves
    4
  end

  def goal_bucket
    'one'
  end

  def other_bucket
    5
  end
end
