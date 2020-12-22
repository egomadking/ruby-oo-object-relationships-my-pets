class Cat
  # code goes here

  attr_accessor :owner, :mood

  @@all = []

  attr_reader :name

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    self.class.all << self
  end

  def self.all
    @@all
  end

end