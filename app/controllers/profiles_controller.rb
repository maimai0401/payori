class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :select_profile, only: [:index, :edit, :update]
  def index
    @profile = ProfileForm.new
  end

  def create
    @profile = ProfileForm.new(profile_params)
    if @profile.valid?
      @profile.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def profile_params
    params.require(:profile_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :introduction).merge(user_id: current_user.id)
  end

  def select_profile
    @user = User.find(params[:user_id])
  end
end
