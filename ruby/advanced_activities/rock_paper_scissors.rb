puts "Welcome to Rock-Paper-Scissors Game"

choices = ["Rock", "Paper", "Scissors"]

humanScore = 0
computerScore = 0


########################
#def method()
#
#end

def score(humanScore,computerScore)
    puts "Your Score: #{humanScore}"
    puts "Computer Score: #{computerScore}" 
end

def humanWin(humanScore,computerChoice)
    humanScore += 1
    puts "You win! Computer chose #{computerChoice}"
end

def computerWin(computerScore,computerChoice)
    computerScore += 1
    puts "Computer wins! Computer chose #{computerChoice}"
end

########################
loop do
	print "Pick your hand! (Rock,Paper,Scissors) "
	humanChoice = gets.chomp

	#random item from choices array
	computerChoice = choices.sample
	
	# Checking for human answer
    if humanChoice == "Rock"
        if computerChoice == "Scissors"
            humanWin(humanScore,computerChoice)
            score(humanScore,computerScore)
        elsif computerChoice == "Paper"
            computerWin(computerScore,computerChoice)
            score(humanScore,computerScore)
        else computerChoice == humanChoice
            puts "Tie! Computer also chose #{computerChoice}"
            score(humanScore,computerScore)
        end
    elsif humanChoice == "Paper"
        if computerChoice == "Scissors"
            computerWin(computerScore,computerChoice)
            score(humanScore,computerScore)
        elsif computerChoice == "Rock"
            humanWin(humanScore,computerChoice)
            score(humanScore,computerScore)
        else computerChoice == humanChoice
            puts "Tie! Computer also chose #{computerChoice}"
            score(humanScore,computerScore)
        end

    elsif humanChoice == "Scissors"
        if computerChoice == "Paper"
            humanWin(humanScore,computerChoice)
            score(humanScore,computerScore)
        elsif computerChoice == "Rock"
            computerWin(computerScore,computerChoice)
            score(humanScore,computerScore)
        else computerChoice == humanChoice
            puts "Tie! Computer also chose #{computerChoice}"
            score(humanScore,computerScore)
        end
    else
        puts "Invalid Input"
    end

    
    var = true
    while var == true
        print "Do you want to play again?(Yes/No): "
        answer = gets.chomp
        
        if answer == "No"
            puts "Thank you for playing!"
            
            sleep 1
            puts "Game created by: Ivan"
            exit
        elsif answer == "Yes"
            var = false
        else
            puts "Invalid Input!"
        end
    end
end