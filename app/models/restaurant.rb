class Restaurant < ActiveRecord::Base
  belongs_to :owner, {class_name: "User", inverse_of: :owned_restaurants}
  has_many :users, through: :reservations
  has_many :reservations

  validates :name, :capacity, presence: true
  validates :capacity, numericality: {only_integer: true}
end
