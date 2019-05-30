class User < ActiveRecord::Base
    has_many :visits

    def have_meal(restaurant)
        visit = Visit.new
        visit.user_id = self.id
        visit.restaurant_id = restaurant.id
        visit.save
    end

    def get_visit_list
        Visit.where("user_id = ?", self.id)
    end
end
