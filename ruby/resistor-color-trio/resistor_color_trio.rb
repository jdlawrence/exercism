=begin
Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
`resistor_color_trio_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-trio` directory.
=end

class ResistorColorTrio
  def initialize(resistances)
    @resistances = resistances
  end

  def getValue(color)
    value = case color
    when 'black'
      0
    when 'brown'
      1
    when 'red'
      2
    when 'orange'
      3
    when 'yellow'
      4
    when 'green'
      5
    when 'blue'
      6
    when 'violet'
      7
    when 'grey'
      8
    when 'white'
      9
    else
      raise ArgumentError
    end
  end

  def label
    value = ""
    value += getValue(@resistances[0]).to_s
    value += getValue(@resistances[1]).to_s
    power = 10 ** getValue(@resistances[2])
    value = value.to_i * power
    "Resistor value: #{value >= 1000 ? value / 1000 : value} #{value >= 1000 ? "kiloohms" : "ohms"}"
  end
end