print "Enter an Integer: "
integer = gets.to_i

checkEven = integer%2;

# if checkEven == 0
#     puts "The number is even"
# else
#     puts "The number is odd"
# end

case checkEven
  when 0 
    puts "The number is even"
  else
    puts "The number is odd"
end