class CoupeCarriage < Carriage
  validates :bottom_seats, :top_seats, presence: :true
end
