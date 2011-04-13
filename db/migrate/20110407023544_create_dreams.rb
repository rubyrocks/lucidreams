class CreateDreams < ActiveRecord::Migration
  def self.up
    create_table :dreams do |t|
      t.datetime :time
      t.string :category
      t.text :dream

      t.timestamps
    end
  end

  def self.down
    drop_table :dreams
  end
end
