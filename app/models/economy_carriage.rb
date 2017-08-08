class EconomyCarriage < Carriage
  validates :bottom_seats, :top_seats, :side_top_seats, :side_bottom_seats, presence: :true
end
