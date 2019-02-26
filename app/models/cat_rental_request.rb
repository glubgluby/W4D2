class CatRentalRequest < ApplicationRecord
    validates :status, presence: true, inclusion: {in: ['PENDING', 'APPROVED','DENIED']}
    validates :start_date, :end_date, :cat_id, presence: true
    validate :valid_date_range
    validate :does_not_overlap_approved_request  

    belongs_to :cat



    def overlapping_requests
        non_overlaps = CatRentalRequest.where(cat_id: self.cat_id).where.not("start_date > ? OR end_date < ?", self.end_date, self.start_date)
    end

    def approved_overlapping_requests
        overlapping_requests.where(status: 'APPROVED')
    end

    def approve! 
        self.status = 'APPROVED' 
        overlapping_requests.where.not(id: self.id).each do |request| 
                request.deny! 
        end
        self.save
    end     

    def deny! 
        self.status = 'DENIED'
        self.save
    end 

    private 
    def valid_date_range
        errors.add(:date_range, "invalid date_range") if start_date > end_date
    end

    def does_not_overlap_approved_request   
        errors.add(:date_range, "Overlapping date_range") unless approved_overlapping_requests.empty? 
    end
end