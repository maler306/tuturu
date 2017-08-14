class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  before_validation :set_title

  validates :title, presence: true
  validate :station_count

  private
  def set_title
    self.title = "#{railway_stations.ordered.first.title} - #{railway_stations.ordered.last.title}"
  end

  def station_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end

end
