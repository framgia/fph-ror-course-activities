class Area
    @@PI = 3.14
    def initialize(radius)
        @radius = radius
    end

    def getArea
        puts @@PI * (@radius * @radius)
    end
end

circle1 = Area.new(15)

circle1.getArea