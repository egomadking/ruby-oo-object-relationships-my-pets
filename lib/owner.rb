require "pry"

class Owner
  # code goes here
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    species
    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def all_pets
    [dogs, cats].flatten
  end

  def sell_pets
    all_pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    message = "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end