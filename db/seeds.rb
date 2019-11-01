# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# config: utf-8

require "csv"

CSV.foreach('db/seeds/csv/character.csv', headers: true) do |row|
    Character.create(
        job_id: row['job_id'],
        char_name: row['name'],
        hp: row['hp'],
        generic1: row['generic1'],
        generic2: row['generic2']
    )
end
