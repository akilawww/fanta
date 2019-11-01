class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nicname
      t.string :hash, unique: true
      t.string :permision
      t.timestamps
    end
  end
end
