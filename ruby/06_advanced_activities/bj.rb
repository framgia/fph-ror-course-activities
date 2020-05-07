dealer_cards = []                                                                                                                                                                                                                    
player_cards = []

  while player_cards.length != 2
    player_cards.push(rand(1..11))
    if player_cards.length == 2
      puts "You have #{player_cards}"
    end
  end

   while dealer_cards.length != 2
     dealer_cards.push(rand(1..11))
   end
  if dealer_cards.inject(:+) == 21
    puts ("Dealer has 21 and wins!")
    exit
  elsif dealer_cards.inject(:+) > 21
    puts ("Dealer has busted!")
    exit
  end

  if player_cards.inject(:+) > 21
    puts "You BUSTED! Dealer wins."
    exit
  elsif player_cards.inject(:+) == 21
    puts "You have BLACKJACK! You WIN!!!"
    exit
  end

while player_cards.inject(:+) < 21
 puts "Do you want to stay or hit?"
 action_taken = gets.chomp
 if action_taken == "hit"
  player_cards.push(rand(1..11))
  if player_cards.inject(:+) > 21
    puts "You BUSTED! Dealer wins."
    exit
  end
  puts "You now have a total of #{player_cards.inject(:+)} from these cards #{player_cards}}"
 else
   puts "The dealer has a total of #{dealer_cards.inject(:+)} with #{dealer_cards}"
   puts "You have a total of #{player_cards.inject(:+)} with #{player_cards}"
 if dealer_cards.inject(:+) > player_cards.inject(:+)
   puts "Dealer wins!"
   break
 else
   puts "You win"
   break
  end
 end
end
