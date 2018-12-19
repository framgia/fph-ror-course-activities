puts "Please enter your grades in the following courses!"
print "Math Grade: "
math = gets.to_i
print "History Grade: "
history = gets.to_i
print "English Grade: "
english = gets.to_i
print "Science Grade: "
science =  gets.to_i

average = (math + history + english + science)/4
puts "Your average is #{average}"