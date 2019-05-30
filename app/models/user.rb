class User < ActiveRecord::Base
    has_many :visits

    def have_meal(restaurant)
        visit = Visit.create(user_id: self.id, restaurant_id: restaurant.id)
    end

    def get_visit_list
        Visit.where("user_id = ?", self.id)
    end
end
