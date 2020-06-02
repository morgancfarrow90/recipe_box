class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :meal_type
      t.string :main_ingrediant
      t.text  :instructions
      t.text  :notes
      t.integer :user_id
    end
  end
end
