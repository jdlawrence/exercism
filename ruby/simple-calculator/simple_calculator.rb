class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError
    def message
      "Unsupported"
    end
  end

  def self.calculate(first_operand, second_operand, operation)
    if not ALLOWED_OPERATIONS.include? operation
      raise UnsupportedOperation
    end

    if not first_operand.is_a? Numeric or not second_operand.is_a? Numeric
      raise ArgumentError.new(
        "All values must be numbers"
      )
    end

    if operation == "/" and second_operand == 0
      return "Division by zero is not allowed."
    end

    if operation == "+"
      "#{first_operand} + #{second_operand} = #{first_operand + second_operand}"
    elsif operation == "/"
      "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
    else
      "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
    end
  end
end
