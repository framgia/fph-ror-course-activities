puts "Welcome to MyStore! Please choose the item that you want to buy!"
print " Chocolates \n Bottled Water \n Biscuits \n Donuts\n"
choice = gets.chomp
items = ["Chocolates", "Bottled Water", "Biscuits", "Donuts"]

# if choice == items[0]
#     puts "You chose #{items[0]}!"
# elsif choice == items[1]
#     puts "You chose #{items[1]}!"
# elsif choice == items[2] 
#     puts "You chose #{items[2]}!"
# elsif choice == items[3] 
#     puts "You chose #{items[3]}"
# else
#     puts "Invalid choice!"
# end


case choice
when items[0]
    puts "You chose #{items[0]}"
when items[1]
    puts "You chose #{items[1]}"
when items[2]
    puts "You chose #{items[2]}"
when items[3]
    puts "You chose #{items[3]}"
else
    puts "Invalid Choice!"
end