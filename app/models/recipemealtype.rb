class RecipeMealType < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :meal_types
end
