print "Please enter a positive odd integer: "
integer = gets.to_i

if integer%2 == 1
    while integer >= 1
        puts integer 
        integer -= 2
    end
else 
    puts "The number you entered is either a negative or an even number."
end
