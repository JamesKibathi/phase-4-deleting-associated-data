class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house =find_dog_by_id
    render json: dog_house, include: :reviews
  end

  def destroy
    dog=find_dog_by_id
    dog.destroy
  
  end

  private

  def find_dog_by_id
    DogHouse.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
