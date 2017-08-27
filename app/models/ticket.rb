class Ticket < ApplicationRecord
  validates :name, :surname, :doc_type, :doc_number, :doc_expire, presence: true

  belongs_to :user
  belongs_to :train
  belongs_to :departure_station, class_name: 'RailwayStation', foreign_key: :departure_station_id
  belongs_to :arrival_station, class_name: 'RailwayStation', foreign_key: :arrival_station_id

  after_create :buy_notification
  after_destroy :cancell_notification

  def route_name
    "#{departure_station.title} - #{arrival_station.title}"
  end

  private
  def buy_notification
    TicketsMailer.buy_ticket(self).deliver_now
  end

    def cancell_notification
    TicketsMailer.cancell_ticket(self).deliver_now
  end
end
