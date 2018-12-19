number = rand(1..10)
tries = 1
puts "Welcome to Guess the Number Game!"

loop do
  print("Please choose a number from 1 to 10: ")
  guess = gets.to_i

  if(guess == number)
    print "Your answer is correct!\nThe number is #{number}\nYou had #{tries} tries\n"
    tries += 1
    break
  elsif(guess > number && guess < 11)
    tries += 1
    print "Your guess number is higher than the number!\nGuess again!\n"
  elsif(guess < number && guess > 0)
    tries += 1
    print "Your guess number is lower than the number!\nGuess again!\n"
  else
    tries += 1
    print "Invalid Input!\n"
  end
end