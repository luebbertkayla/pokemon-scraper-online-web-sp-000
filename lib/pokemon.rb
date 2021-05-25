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
    
pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]

    pokemon_inst = Pokemon.new(id: id, name: name, type: type, hp: hp, db: database_connection)
  end
end 
