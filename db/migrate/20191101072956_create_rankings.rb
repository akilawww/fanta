class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.reference :user_hash, foreign_key: true
      t.string :music_name
      t.integer :score
      t.integer :damage
      t.reference :character_id1, foreign_key: true
      t.reference :character_id2, foreign_key: true
      t.reference :character_id3, foreign_key: true
      t.reference :character_id4, foreign_key: true
      t.timestamps
    end
  end
end
