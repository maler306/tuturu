class AddNameAndSurNameAndDocTypeAndDocNumberAndDocExpireToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :surname, :string
    add_column :tickets, :doc_type, :string
    add_column :tickets, :doc_number, :string
    add_column :tickets, :doc_expire, :date
  end
end
