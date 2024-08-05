class AddStatusAndPriorityToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :status, :integer, default: 0, null: false
    add_column :tickets, :priority, :integer,  default: 0, null: false
  end
end
