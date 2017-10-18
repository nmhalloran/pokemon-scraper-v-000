class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize (attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @type = attributes[:type]
    @hp = attributes[:hp]
    @db = attributes[:db]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    catch = Pokemon.new({id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], hp: pokemon_array[3],  db:db})
  end

  def self.alter_hp(hp, db)
    db.execute("UPDATE hp SET hp = ? WHERE name = ?", hp, self)
  end

end
