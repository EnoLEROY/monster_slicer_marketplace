class Product < ApplicationRecord
  belongs_to :user
  has_many :rentings

  has_one_attached :product_image

  validates :title, :price, :description, :category, :product_image, presence: true
  # ligne a verifier pour recupérer les users qui louent un produit
  # has_many :users, through: :rentings

  CATEGORIES = ["Weapon", "Equipement", "Enchentment", "Potion"]
end
