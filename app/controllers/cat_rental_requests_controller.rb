class CatrentalrequestsController < ApplicationController


    def create 
        @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
        @cat_rental_request.save ? (redirect_to cat_url(@cat_rental_request.cat_id)) : (redirect_to cats_url)
    end

    private
    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end
    
end