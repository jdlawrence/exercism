# Write your code for the 'Simple Cipher' exercise in this file. Make the tests in
# `simple_cipher_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/simple-cipher` directory.
class Cipher
  def initialize(key = 'aaaaaaaaaa')
    @key = key

    contains_upper
    contains_number
    is_empty_string
  end

  attr_reader :key

  def encode(plaintext)
    result = ''

    plaintext.each_char.with_index do |_letter, index|
      shift = key[index].ord - 97
      temp = plaintext[index].ord + shift
      temp -= 26 if temp > 122
      result += temp.chr
    end
    result
  end

  def decode(plaintext)
    result = ''

    plaintext.each_char.with_index do |_letter, index|
      shift = key[index].ord - 97
      result += (plaintext[index].ord - shift).chr
    end
    result
  end

  private

  def contains_upper
    return unless /[[:upper:]]/.match(key)

    raise ArgumentError
  end

  def contains_number
    return unless key =~ /\d/

    raise ArgumentError
  end

  def is_empty_string
    return unless key == ''

    raise ArgumentError
  end
end
