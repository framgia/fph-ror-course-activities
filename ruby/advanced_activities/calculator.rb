first_num = 0
second_num = 0

#checks for valid first number
#if valid number is entered, stop the loop.
loop do
  print("Enter first number: ")
  first_num = gets.chomp
  
  if first_num.to_i != 0
    first_num = first_num.to_i
    break
  else
    puts "Error: Please enter a valid number!"
  end
end

#checks for valid second number
#if valid number is entered, stop the loop.
loop do
  print("Enter second number: ")
  second_num = gets.chomp

  if second_num.to_i != 0
    second_num = second_num.to_i
    break
  else
    puts "Error: Please enter a valid number!"
  end
end

######################
def add(num1,num2)
  num1 + num2
end

def minus(num1,num2)
  num1 - num2
end

def multiply(num1,num2)
  num1 * num2
end

def divide(num1,num2)
  num1 / num2
end



######################

#checks for valid operator
#if valid operator is entered, stop the loop.
loop do 
  print("Please choose operator: (+, -, *, /) ")
  operator = gets.chomp
  if operator == "+"
    # puts first_num + second_num
    puts "The sum is #{add(first_num,second_num)}"
    break
    
  elsif operator == "-"
    puts "The difference is: #{minus(first_num,second_num)}"
    break
  elsif operator == "*"
    puts "The product is: #{multiply(first_num,second_num)}"
    break
  elsif operator == "/"
    puts "The qoutient is: #{divide(first_num,second_num)}"
    break
  else
    puts "Invalid Operator!"
  end
end