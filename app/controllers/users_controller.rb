class UsersController < Clearance::UsersController

  def show
    @user = User.find_by(username: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
    redirect_to user_path(@user)
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end