class Booking < ApplicationRecord
  belongs_to :listing, dependent: :destroy

  validates :listing_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
