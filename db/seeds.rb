# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

user_serialized = open(url).read
ingredients = JSON.parse(user_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

@cocktails = %w(Caipirinha Mojito Margarita Cosmopolitan Martini Manhattan Spritz Mimosa Daiquiri).sort

puts "Creating cocktails..."

@cocktails.each do |cocktail|
  Cocktail.create(name: cocktail)
end

puts "Finished!"
