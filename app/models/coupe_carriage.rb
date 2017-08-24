class CoupeCarriage < Carriage
  validates :bottom_seats, :top_seats, numericality: { only_integer: true, greater_than: 0 }
end
