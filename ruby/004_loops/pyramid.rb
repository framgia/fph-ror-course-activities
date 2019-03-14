print "Enter an integer: "
x = gets.to_i
y = x
i = 0

while y > i do
    
    a = 1
    while a < y do
        print ' '
        a += 1
    end
    
    b = 0
    c = (x - y) * 2
    while b <= c do
        print '*'
        b += 1
    end

    y -= 1
    puts ''
end
