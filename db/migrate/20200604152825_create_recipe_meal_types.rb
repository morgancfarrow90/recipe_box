class CreateRecipeMealTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_meal_types do |t|
      t.integer :meal_type_id
      t.integer :recipe_id
    end
  end
end
