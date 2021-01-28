class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @profile = ProfileForm.new
  end


  def create
    @profile = ProfileForm.new(profile_params)
    if @profile.valid?
      # binding.pry
      @profile.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def profile_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :introduction).merge(user_id: current_user.id)
  end

end
