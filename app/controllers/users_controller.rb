class UsersController < Clearance::UsersController
  before_action :set_user, only: [:show, :edit, :update]
  before_action only: [:edit, :update] do
    verify_user @user
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
    redirect_to user_path(@user)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Successfully updated."
    else
      render :edit, alert: "Something went wrong."
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find_by(username: params[:id]) or not_found
  end

  def verify_user(obj)
    if obj != current_user
      redirect_to user_path(obj)
    end
  end

end