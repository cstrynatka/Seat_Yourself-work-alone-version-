require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  # test "fixture must be valid" do
  #   restaurant = restaurants(:one)
  #   assert restaurant.valid?
  # end

  # test "must not save if name does not exist" do
  #   restaurant = Restaurant.create(capacity: 100)
  #   assert_not restaurant.valid? # If you have validations in your model, '.valid?' makes sure that the record object must satisfy the validations
  #   # Test will pass when restaurant.valid? is false,
  #   # since assert_not expects a false statement
  # end

  test "must not save if name does not exist" do
    restaurant = restaurants(:one)
    restaurant.name = nil
    assert_not restaurant.valid?
  end
end
