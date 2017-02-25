=begin Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).

#You'll need three pieces of information:

the loan amount
the Annual Percentage Rate (APR)
the loan duration
From the above, you'll need to calculate the following two things:

monthly interest rate
loan duration in months
You can use the following formula:

Mortgage Calculator Formula

Translated to Ruby, this is what the formula looks like:

m = p * (j / (1 - (1 + j)**(-n)))
m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months
Finally, don't forget to run your code through Rubocop.

Hints:

Figure out what format your inputs need to be in. For example, should the interest rate be expressed as 5 or .05, if you mean 5% interest?
If you're working with Annual Percentage Rate (APR), you'll need to convert that to a monthly interest rate.
Be careful about the loan duration -- are you working with months or years? Choose variable names carefully to assist in remembering.
=end

# ask for the loan amount
# ask for the monthly interest rate
# ask for the loan duration in months
# perform the operation to calculate the monthly payment
# output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt("Welcome to Mortgage Calculator!")

  prompt("What's the loan amount?")

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()

    if loan_amount.empty?() || loan_amount.to_f() < 0
      prompt("Please enter a positive number")
    else
      break
    end
  end

  prompt("What's the monthly interest rate? (For example, put 5 if the monthly interest rate is 5%")

  interest_rate = ''
  loop do 
    interest_rate = Kernel.gets().chomp()

    if interest_rate.empty?() || interest_rate.to_f() < 0
      prompt("Please enter a positive number")
    else
      break
    end
  end

  prompt("What's the loan duration? (in years)")

  loan_duration = ''
  loop do
    loan_duration = Kernel.gets().chomp()

    if loan_duration.empty?() || loan_duration.to_i() < 0
      prompt("Enter a valid number")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = loan_duration.to_i() * 12

  monthly_payment = loan_amount.to_f() * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-months.to_i())))
  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt('Do you want another calculation?')
  response = Kernel.gets().chomp()

  break unless response.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")


