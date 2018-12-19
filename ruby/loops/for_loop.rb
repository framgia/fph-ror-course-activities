# print "Enter an integer: "
# x = gets.to_i

# for i in 1..x do
#     puts i*2
# end

# puts "Done!"
x = [10, 21, 30, 45, 53]
names = ["Ivan", "Yutaka", "Hironao", "Takuya"]

# for i in x do
#     if i%2 == 0
#         puts "#{i} - Even"
#     else
#         puts "#{i} - Odd"
#     end
# end
test = 0 
for i in names do
    case i
        when "Ivan"
            puts "#{i} is #{test}"
        when "Yutaka"
            puts "#{i} is #{test}"
        when "Hironao"
            puts "#{i} is #{test}"
        when "Takuya"
            puts "#{i} is #{test}"
    end
    test += 1
end