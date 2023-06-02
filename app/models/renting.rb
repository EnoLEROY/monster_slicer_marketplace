class Renting < ApplicationRecord
  attr_accessor :total_price

  belongs_to :user
  belongs_to :product

  validates :start_date, :end_date, presence: true
end
