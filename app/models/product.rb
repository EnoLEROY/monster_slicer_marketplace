class Product < ApplicationRecord
  belongs_to :user
  has_many :rentings

  has_one_attached :product_image

  validates :title, :price, :description, :category, presence: true
  # ligne a verifier pour recupérer les users qui louent un produit
  # has_many :users, through: :rentings

  CATEGORIES = ["Weapons", "Equipement", "Enchentment", "Potions"]
end
