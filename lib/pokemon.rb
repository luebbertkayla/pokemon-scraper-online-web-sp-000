class Pokemon
  attr_reader :id, :name, :type, :db
  
  @@all =[]
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self 
  end 
  
  def self.save(name, type, @db)
    DB[:conn].execute("INSERT INTO pokemon (name, type) VALUES (?, ?), name, type")
  end 
end
