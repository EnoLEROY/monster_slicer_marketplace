class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :start_date, :end_date, presence: true
end
