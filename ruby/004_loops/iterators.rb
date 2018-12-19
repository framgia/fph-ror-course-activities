names = ["John", "Jane", "Joe"]
counter = 1

names.each do |name|
  puts "#{counter}. #{name}"
  counter = counter + 1
end


names.each {|name| puts name}