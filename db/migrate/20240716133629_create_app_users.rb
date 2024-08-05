class CreateAppUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :app_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
