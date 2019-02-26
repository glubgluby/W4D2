class Cat < ApplicationRecord

    validates :sex, :birth_date, :name, :color, :description, presence: true
    validates :sex, inclusion: {:in => ['M', 'F']}
    
    has_many :cat_rental_requests,
        dependent: :destroy

    def age
        return Date.today.year - birth_date.year
    end 

end