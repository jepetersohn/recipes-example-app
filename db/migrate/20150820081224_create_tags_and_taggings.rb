class CreateTagsAndTaggings < ActiveRecord::Migration
  def change
    ##### TAGS ######
    create_table :tags do |t|
      t.string :name
    end

    # name is used as a lookup field, so it should be indexed
    add_index :tags, :name, unique: true

    ##### TAGGINGS ######
    create_table :taggings do |t|
      t.references :tag
      t.references :recipe
    end

    # on join tables it's necessary to create a composite index
    # with both foreign_keys, as well as an index for just the
    # second foreign_key in the composite key
    add_index :taggings, [:tag_id, :recipe_id]
    add_index :taggings, :recipe_id
  end
end
