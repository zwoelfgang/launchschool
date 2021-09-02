require 'yaml'

PROMPTS = YAML.load_file('mortgage_prompts.yml')

def output(message)
  puts("=> " + message)
end

def input
  gets.chomp.to_f
end

loop do
  output(PROMPTS['welcome'])
  output(PROMPTS['amount'])

  loan_amount = input()

  while loan_amount == 0.0
    output(PROMPTS['invalid'])
    loan_amount = input()
  end

  output(PROMPTS['apr'])

  apr = input

  while apr == 0.0
    output(PROMPTS['invalid'])
    apr = input
  end

  output(PROMPTS['duration'])

  loan_duration = input

  while loan_duration == 0.0
    output(PROMPTS['invalid'])
    loan_duration = input
  end

  monthly_interest = (apr / 100) / 12
  monthly_duration = loan_duration * 12
  monthly_payment = loan_amount * (monthly_interest /
                    (1 - (1 + monthly_interest)**(-monthly_duration)))
  dollar_payment = "$" + monthly_payment.round(2).to_s

  output(PROMPTS['outcome'])
  output(dollar_payment)

  output(PROMPTS['again'])
  answer = gets.chomp

  answer == 'y' ? TRUE : break
end
