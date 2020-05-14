# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

json = URI.open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
ingredients = JSON.parse(json.read)["drinks"]
ingredients.each do |ingredient|
  instance_ingredient_name = Ingredient.new(name: ingredient["strIngredient1"])
  puts "creating #{instance_ingredient_name.name}"
  instance_ingredient_name.save
end
