class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :party_size, presence: true
  validate :capacity_exists # customed validation

  def capacity_exists # 还有没有空位
    existing_reservations = Reservation.where("restaurant_id = ? and dinner_time > ? and dinner_time < ?", self.restaurant_id, self.dinner_time.at_beginning_of_hour, self.dinner_time.at_end_of_hour)
    total_people = existing_reservations.sum(:party_size) #32
    restaurant_capacity = self.restaurant.capacity #40
    if (self.party_size + total_people) > restaurant_capacity
      # errors.add(:party_size, "Capacity exceeded") # party_size is called 'field'
      errors[:base] << "Capacity exceeded"
    end
  end
end
