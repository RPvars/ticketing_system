class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :requester_name
      t.string :requester_email
      t.string :requester_phone
      t.integer :requester_type
      t.string :problem_title
      t.text :problem_description
      t.string :link
      t.integer :language
      t.references :assignee, foreign_key: { to_table: :users }
      t.references :app, foreign_key: true
      t.references :related_ticket, foreign_key: { to_table: :tickets }

      t.timestamps
    end
  end
end
