class CatsController < ApplicationController


    def index
        @cats = Cat.all
        render :index

    end

    def show 
        @cat = Cat.find_by(id: params[:id])
        @requests = CatRentalRequest.where(cat_id: params[:id])
        render :show 
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit
        @cat = Cat.find_by(id: params[:id])
        @cat.persisted? ? (render :edit) : (redirect_to cats_url)
    end

    def create 
        @cat = Cat.new(cat_params)
        @cat.save ? (redirect_to cat_url(@cat)) : (redirect_to cats_url)
    end

    def update
        @cat = Cat.find_by(id: params[:id])
        @cat.update(cat_params) ? (redirect_to cat_url(@cat)) : (redirect_to cats_url)
    end
        


    private
    def cat_params
        params.require(:cat).permit(:birth_date,:name,:color,:sex,:description)
    end
end