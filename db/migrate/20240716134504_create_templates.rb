class CreateTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :templates do |t|
      t.integer :template_type, null: false
      t.string :name, null: false
      t.text :content, null: false
      t.integer :target, null: false

      t.timestamps
    end
  end
end
