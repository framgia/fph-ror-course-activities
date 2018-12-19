x = 1
while x <= 6
  puts "*" * x
  x = x + 1
end

x = 5

loop do
  puts "*" * x
  x = x - 1

  break if x < 1
end