class User < ActiveRecord::Base
  has_secure_password  # Add in hidden validation 'presence: ture' for 'password' and 'password_confirmation'
  validates :first_name, :last_name, :email, presence: true
  validates :email, confirmation: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: "not a valid email address" }  # this message can be accessed in '@user.errors.message'
  validates :email_confirmation, presence: true
  # validates :email_confirmation, :format => { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    # message: "only allows letters" }
  has_many :restaurants, through: :reservations
  has_many :owned_restaurants, class_name: "Restaurant"
end


# Notes:
# 1. You can't chain up validations in a row. Each validation
#    must be written in a new line.
# 2. For examination of email address, we only need to test 
#    RegEx once, either on :email or :email_confirmation