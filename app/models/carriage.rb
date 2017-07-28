class Carriage < ApplicationRecord
  TYPE = { economy: 'плацкарт', coupe: 'купе' }.freeze
  belongs_to :train

  validates :carriage_type, :bottom_seats, :top_seats, presence: true

  def self.types
    TYPE
  end
end
