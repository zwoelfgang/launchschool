require 'yaml'
require 'io/console'
require 'pry'

PROMPTS = YAML.load_file('mortgage_prompts.yml')

def output(message)
  puts("=> " + message)
end

def input
  gets.chomp
end

def clear_screen
  STDOUT.clear_screen
end

def validation(value)
  while value == 0
    output(PROMPTS['invalid'])
    value = input.to_f
  end
  value
end

def negative_check(value)
  if value < 0
    value = value.abs
    output(PROMPTS['conversion'])
  end
  value
end

clear_screen

output(PROMPTS['welcome'])

catch :restart do
  loop do
    output(PROMPTS['amount'])
    loan_amount = input.to_f
    loan_amount = validation(loan_amount)
    loan_amount = negative_check(loan_amount)

    output(PROMPTS['apr'])
    apr = input

    if apr == "0"
      output(PROMPTS['congrats'])
      apr = apr.to_f
    else
      apr = apr.to_f
      apr = validation(apr)
      apr = negative_check(apr)
    end

    output(PROMPTS['duration'])
    loan_duration = input.to_f
    loan_duration = validation(loan_duration)
    loan_duration = negative_check(loan_duration)

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
    answer = input.downcase

    loop do
      case answer
      when 'y'
        clear_screen
        break
      when 'n'
        throw :restart
      else
        output(PROMPTS['restart'])
        answer = input.downcase
      end
    end
  end
end

clear_screen
output(PROMPTS['goodbye'])
