# Write your code for the 'Simple Cipher' exercise in this file. Make the tests in
# `simple_cipher_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/simple-cipher` directory.
class Cipher
  def initialize
    @key = 'aaaaaaaaaa'
  end

  attr_reader :key
end

dummy = 'jamil'

cipher = 'aaaa'

puts dummy + cipher
