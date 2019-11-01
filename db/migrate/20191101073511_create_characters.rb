class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.integer :job_id
      t.string :char_name
      t.integer :hps
      t.integer :generic1
      t.integer :generic2
      t.string :image_path
      t.timestamps
    end
  end
end
