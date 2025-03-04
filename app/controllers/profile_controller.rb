class ProfileController < ApplicationController

  def index
    render json: {message: "Hello"}
  end

  def show
    the_id = params[:id]
    @profile = Profile.find_by(user_id: the_id)
    render :show
  end
end
