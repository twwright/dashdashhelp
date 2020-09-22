class SessionsController < Clearance::SessionsController

   def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user 
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      @next = edit_user_path(user)   
      @notice = "User created - confirm or edit details..."
    end
    sign_in(user)
    flash[:success] = @notice
    redirect_to @next
  end
  
  private

  def authenticate(_)
    super(session_params)
  end

  def session_params
    { session: session_params_with_email }
  end

  def session_params_with_email
    params.
      require(:session).
      permit(:password).
      merge(email: user.email)
  end

  def user
    User.
      where(email: email_or_username).
      or(User.where(username: email_or_username)).
      first || Guest.new
  end

  def email_or_username
    params[:session][:email_or_username]
  end

end