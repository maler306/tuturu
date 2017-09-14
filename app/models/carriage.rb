class Carriage < ApplicationRecord
  TYPE = { PremiumCarriage: 'СВ', CoupeCarriage: 'купе', EconomyCarriage: 'плацкарт', SeatCarriage: 'сидячий' }.freeze
  belongs_to :train

  before_validation :set_number
  validates :number, presence: true, uniqueness: { scope: :train_id }
  validates :type,  presence: true

  scope :carriages_type, -> (type) { where(type: type.to_s) }

  private

  def set_number
    self.number ||= train.carriages.maximum(:number).to_i + 1
  end

end
