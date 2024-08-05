class AddMissingTaggableIndex < ActiveRecord::Migration[7.1]
  def up
    # Check if the index exists before trying to add it
    unless index_exists?(:taggings, [:taggable_id, :taggable_type, :context], name: 'taggings_taggable_context_idx')
      add_index :taggings, [:taggable_id, :taggable_type, :context], name: 'taggings_taggable_context_idx'
    end
  end

  def down
    if index_exists?(:taggings, [:taggable_id, :taggable_type, :context], name: 'taggings_taggable_context_idx')
      remove_index :taggings, name: 'taggings_taggable_context_idx'
    end
  end
end
