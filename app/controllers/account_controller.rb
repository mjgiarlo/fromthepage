class AccountController < ApplicationController
  # TODO: Replace this AuthenticationSystem stuff w/ devise
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
  # If you want "remember me" functionality, add this before_filter to Application Controller
  before_filter :login_from_cookie

  # say something nice, you goof!  something sweet.
  def index
    redirect_to(:action => 'signup') unless logged_in? || User.count > 0
  end

  def login
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(:controller => 'dashboard', :action => 'index')
      flash[:notice] = "Logged in successfully"
    else
      if(User.find_by_login(params[:login])) 
        flash[:error] = 
          "Your login and password did not match.  Feel free to contact alpha.info@fromthepage.com for help."
      else
        flash[:error] = "We could not find any user with the login #{params[:login]}.  Feel free to contact alpha.info@fromthepage.com for help."
      end
    end
  end

  def signup      
    @user = User.new(params[:user])
    return unless request.post?
    if !simple_captcha_valid?
      flash[:error] = "Please retype the image text"
      return
    end
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => 'dashboard', :action => 'index')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'signup'
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => 'dashboard', :action => 'index')
  end
end
