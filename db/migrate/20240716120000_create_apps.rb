class CreateApps < ActiveRecord::Migration[7.1]
  def change
    create_table :apps do |t|
      t.string :domain, null: false
      t.string :user_name, null: false
      t.string :company_name, null: false
      t.string :work_hours, null: false

      t.timestamps
    end

    add_index :apps, :domain, unique: true
  end
end
