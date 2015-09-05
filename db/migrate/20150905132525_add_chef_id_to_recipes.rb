class AddChefIdToRecipes < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.references :chef, index: true
    end
  end
end
