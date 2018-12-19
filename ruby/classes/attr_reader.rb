class Person
	# attr_reader :name, :age #getters
	# attr_writer :name, :age #setters
	attr_accessor :name, :age

	# def initialize(name,age)
	# 	@name = name
	# 	@age = age
	# end

	# def walk()
	# 	puts "I am walking"
	# end
	
	#setters
	def name=(name)
		@name = name
	end

	def age=(age)
		@age = age
	end

	#getters
	def name
		@name
	end

	def age
		@age
	end
end

# ivan = Person.new("ivan",21)
# ivan.walk
ivan = Person.new
ivan.name="ivan"
ivan.age=21

puts ivan.name
puts ivan.age

# class Teacher < Person

# end

