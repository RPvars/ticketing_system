class AddMissingUniqueIndices < ActiveRecord::Migration[7.1]
  def up
    add_index :tags, :name, unique: true, name: 'index_tags_on_name'

    # Check if the index exists before trying to remove it
    if index_exists?(:taggings, :tag_id)
      # Skip removing the index if it exists due to a foreign key constraint
      # remove_index :taggings, :tag_id
      add_index :taggings, :tag_id, name: 'index_taggings_on_tag_id' unless index_exists?(:taggings, :tag_id, name: 'index_taggings_on_tag_id')
    end

    if index_exists?(:taggings, [:taggable_id, :taggable_type, :context])
      remove_index :taggings, name: 'taggings_taggable_context_idx'
      add_index :taggings, [:taggable_id, :taggable_type, :context], name: 'taggings_taggable_context_idx'
    end
  end

  def down
    remove_index :tags, name: 'index_tags_on_name'
    remove_index :taggings, name: 'index_taggings_on_tag_id' if index_exists?(:taggings, :tag_id)
    remove_index :taggings, name: 'taggings_taggable_context_idx' if index_exists?(:taggings, [:taggable_id, :taggable_type, :context])
  end
end
