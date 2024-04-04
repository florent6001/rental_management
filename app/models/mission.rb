class Mission < ApplicationRecord
  belongs_to :listing, dependent: :destroy

  validates :listing, presence: true
  validates :mission_type, presence: true
  validates :date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
