class Carriage < ApplicationRecord
  TYPE = { EconomyCarriage: 'плацкарт', CoupeCarriage: 'купе', PremiumCarriage: 'СВ', SeatCarriage: 'сидячий' }.freeze
  belongs_to :train

  before_validation :set_number
  validates :number, :type,  presence: true, uniqueness: { scope: :train_id }

  def set_number
    self.number ||= train.carriages.maximum(:number).to_i + 1
  end

end
