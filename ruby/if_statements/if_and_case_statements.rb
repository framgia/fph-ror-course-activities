print("Enter an integer: ")
first_num = gets.to_i 

print("Enter second integer: ")
second_num = gets.to_i

print("Choose your math operation (+,-,*,/): ")
operation = gets.chomp

#IF STATEMENT
# if operation == '+'
#   puts("The sum is: #{first_num + second_num}")
# elsif operation == '-'
#   puts("The difference is: #{first_num - second_num}")
# elsif operation == '*'
#   puts("The product is: #{first_num * second_num}")
# elsif operation == '/'
#   puts("The quotient is: #{first_num / second_num}")
# else
#   puts("Error! Operation not found!")
# end

#CASE STATEMENT
case operation
  when '+'
    puts "The sum is: #{first_num + second_num}"
  when '-'
    puts "The difference is: #{first_num - second_num}"
  when '*'
    puts "The product is: #{first_num * second_num}"
  when '/'
    puts "The quotient is: #{first_num + second_num}"
  else
    "Error! Operation not found."
end