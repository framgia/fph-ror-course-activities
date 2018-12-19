class Person
  @@people = []

  def initialize(name, age, address)
    @name = name
    @age = age
    @address = address

    @@people << self
  end

  def age
    @age
  end

  def address
    @address
  end

  def name
    @name
  end

  def self.people
    @@people
  end

  def self.display_names
    Person.people.each { |person| puts person.name  }
  end
end

person1 = Person.new("Hani", 22, "Cebu")
person2 = Person.new("Ivan", 21, "Bacolod")
person3 = Person.new("Masa", 22, "Japan")
Person.display_names
