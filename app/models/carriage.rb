class Carriage < ApplicationRecord
  TYPE = { economy: 'плацкарт', coupe: 'купе' }.freeze
  belongs_to :train

  validates :number, :carriage_type, :bottom_seats, :top_seats, presence: true

end
