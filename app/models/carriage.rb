class Carriage < ApplicationRecord
  TYPE = { EconomyCarriage: 'плацкарт', CoupeCarriage: 'купе', PremiumCarriage: 'СВ', SeatCarriage: 'сидячий' }.freeze
  belongs_to :train

  before_validation :set_number
  validates :number, :type,  presence: true, uniqueness: { scope: :train_id }

  scope :economys, -> { where(type: Carriage::TYPE.keys[0].to_s) }
  scope :coupes, -> { where(type: Carriage::TYPE.keys[1].to_s) }
  scope :premium, -> { where(type: Carriage::TYPE.keys[2].to_s) }
  scope :sedentary, -> { where(type: Carriage::TYPE.keys[3].to_s) }

  private

  def set_number
    self.number ||= train.carriages.maximum(:number).to_i + 1
  end

end
