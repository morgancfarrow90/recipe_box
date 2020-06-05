class MealType < ActiveRecord::Base
  has_many :recipe_meal_types
  has_many :recipes, through: :recipe_meal_types
end
