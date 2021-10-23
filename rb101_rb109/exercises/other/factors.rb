=begin
________________________________________________________________________________

*****Problem*****
________________________________________________________________________________
Input:

  Target: Natural number that is the limit (where we stop counting)
  Factors: One or more natural numbers that the output must be divisible by

Output:

  The sum of the multiples of one or more of the factors from 1 to the target

Explicit reqs:

  - Must be natural numbers (integers greater than 1)
  - Multiples must be divisible of one or more factors
  - If no factors are present, must default to 3 and 5

Implicit reqs:

  - What if we have only one factor? Do we default to 3 or 5 for the second?
  - Target is non-inclusive
________________________________________________________________________________

*****Examples/Test cases*****
________________________________________________________________________________
Test cases:

  factors(20, 3, 5) == 78
________________________________________________________________________________

*****Data structures*****
________________________________________________________________________________
Data manipulation strategy:

  Factors: Array of integers
  Target: Integer
  Manipuation in between: Array to store multiples
  Return: An integer sum
________________________________________________________________________________

*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):

  - Take in a target, factors as arguments
  - Loop through the numbers from 1 to target
    - Check each number is divisible by one or more factors
    - If yes, add to array. If no, move to next number
  - Compute the sum of all elements in the multiples array and return that value
________________________________________________________________________________

Time to code!

=end

def factors(target, factors = [3, 5])
  multiples = []
  (1..target - 1).each do |num|
    if factors.select { |factor| num % factor == 0 }.size > 0
      multiples << num
    end
  end
  multiples.sum
end


factors(20, [3, 5])  # returns 78
factors(20, [3])     # returns 63
factors(20, [5])     # returns 30
factors(20)          # returns 78
factors(1, [])       # returns 0
factors(20, [19])    # returns 19