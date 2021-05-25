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
  
    def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type) 
        VALUES (?, ?);
      SQL
    
      db.execute(sql, name, type)
    end
    
def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]

    pokemon_instance = Pokemon.new(id: id, name: name, type: type, db: database_connection)
  end
end 
