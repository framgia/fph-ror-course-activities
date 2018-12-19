class Box
  attr_accessor(:width, :height, :length)

  def initialize(w, h, l)
    @width = w
    @height = h
    @length = l
  end

  def display
    puts "width  : #{@width}"
    puts "height : #{@height}"
    puts "length : #{@length}"
    puts "Area of the box is: #{area}"
  end

  def area
    (2 * @length * @width) + (2 * @length * @height) + (2 * @width * @height)
  end
end

box1 = Box.new(100, 500, 200)
box1.display
puts box1.area