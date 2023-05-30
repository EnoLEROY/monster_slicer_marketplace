class Product < ApplicationRecord
  belongs_to :user
  has_many :rentings

  validates :title, :price, :description, :category, presence: true
  # ligne a verifier pour recupérer les users qui louent un produit
  # has_many :users, through: :rentings
end
