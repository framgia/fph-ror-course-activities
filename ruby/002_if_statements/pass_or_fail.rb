print "Enter your English grade percentage: "
grade = gets.to_i

# if grade >= 75 && grade <= 100
#     puts "You Passed!"
# elsif grade >= 0 && grade <= 74
#     puts "You Failed!"
# else 
#     puts "Invalid Input"
# end

case
when grade >= 75 && grade <= 100
    puts "You Passed"
when grade >= 0 && grade <= 74
    puts "You Failed"
else
    puts "Invalid Input"
end