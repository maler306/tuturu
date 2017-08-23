class ChangeSeatsInCarriage < ActiveRecord::Migration[5.1]
  def change
    change_column_default :carriages, :top_seats, from: nil, to: 0
    change_column_default :carriages, :bottom_seats, from: nil, to: 0
    change_column_default :carriages, :side_top_seats, from: nil, to: 0
    change_column_default :carriages, :side_bottom_seats, from: nil, to: 0
    change_column_default :carriages, :seats, from: nil, to: 0
  end
end
