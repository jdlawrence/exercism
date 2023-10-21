module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      -3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    if balance < 0
      balance * (100 - self.interest_rate(balance)) / 100
    else
      balance * (100 + self.interest_rate(balance)) / 100
    end
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    count = 0
    return 0 if current_balance < 0
    while current_balance < desired_balance
      current_balance = self.annual_balance_update(current_balance)
      count += 1
    end
    count
  end
end

# a = SavingsAccount.annual_balance_update(-1500)
# b = SavingsAccount.annual_balance_update(1500)
# c = SavingsAccount.years_before_desired_balance(1500, 2000)
# puts a
# puts b
# puts c

