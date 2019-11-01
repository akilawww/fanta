class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.reference :user_id, foreign_key: true
      t.reference :character_id1, foreign_key: true
      t.reference :character_id2, foreign_key: true
      t.reference :character_id3, foreign_key: true
      t.reference :character_id4, foreign_key: true
      t.timestamps
    end
  end
end
