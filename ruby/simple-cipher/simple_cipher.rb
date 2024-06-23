# Write your code for the 'Simple Cipher' exercise in this file. Make the tests in
# `simple_cipher_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/simple-cipher` directory.
class Cipher
  def initialize(key = "aaaaaaaaaa")
    @key = key

    contains_upper
    contains_number
    is_empty_string
  end

  attr_reader :key

  def encode(plaintext)
    result = ""
    
    for pos in 0...plaintext.length
      shift = key[pos].ord - 97
      result += (plaintext[pos].ord + shift).chr
    end
    result
  end

  def decode(plaintext)
    result = ""

    for pos in 0...plaintext.length
      shift = key[pos].ord - 97
      result += (plaintext[pos].ord - shift).chr
    end
    result
  end

  private
  def contains_upper
    if /[[:upper:]]/.match(key)
      raise ArgumentError
    end
  end

  def contains_number
    if key =~ /\d/
      raise ArgumentError
    end
  end

  def is_empty_string
    if key == ""
      raise ArgumentError
    end
  end
end

puts "***************"
puts "a".ord