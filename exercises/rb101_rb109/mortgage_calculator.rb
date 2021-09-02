require 'yaml'
require 'pry'

PROMPTS = YAML.load_file('mortgage_prompts.yml')

def output(message)
  puts("=> " + message)
end

def input
  gets.chomp
end

def validation(value)
  while value == 0
    output(PROMPTS['invalid'])
    value = input.to_f
  end
  value
end

output(PROMPTS['welcome'])

loop do
  output(PROMPTS['amount'])
  loan_amount = input.to_f
  validation(loan_amount)

  output(PROMPTS['apr'])
  apr = input

  if apr == "0"
    output(PROMPTS['congrats'])
    apr = apr.to_f
  else
    apr = apr.to_f
    validation(apr)
  end

  output(PROMPTS['duration'])
  loan_duration = input.to_f
  validation(loan_duration)

  monthly_interest = (apr / 100) / 12
  monthly_duration = loan_duration * 12

  if apr != 0
    monthly_payment = loan_amount * (monthly_interest /
                      (1 - (1 + monthly_interest)**(-monthly_duration)))
  else
    monthly_payment = loan_amount / monthly_duration
  end

  dollar_payment = "$" + monthly_payment.round(2).to_s

  output(PROMPTS['outcome'])
  output(dollar_payment)

  output(PROMPTS['again'])
  answer = input

  answer == 'y' ? TRUE : break
end

output(PROMPTS['goodbye'])
