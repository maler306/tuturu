class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.references :train, foreign_key: true
      t.references :departure_station, foreign_key: true
      t.references :arrival_station, foreign_key: true

      t.timestamps
    end
  end
end
