class CreateCarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.string :carriage_type
      t.integer :number
      t.integer :bottom_seats
      t.integer :top_seats
      t.references :train, foreign_key: true

      t.timestamps
    end
  end
end
