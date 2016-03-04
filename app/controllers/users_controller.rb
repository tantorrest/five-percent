class UsersController < ApplicationController
  def sign_up
  	@newuser = User.new	
  end

  def sign_in
  	@newuser = User.new	
  end

  def create
  	@newuser = User.new(user_params(params[:user]))
  	@newuser.color1 = rand(255)
  	@newuser.color2 = rand(255)
  	@newuser.color3 = rand(255)
  	if @newuser.save
  		session[:id] = @newuser.id
  		redirect_to(:controller => 'project', :action => 'list');
  	else
  		render(:action => 'sign_in')
  	end
  end

  def post_login
  	user = User.where(:username => params[:user][:username])[0]
  	password = params[:user][:password]
  	if user && password then
  		if user.password_valid? password then
  			session[:id] = user.id
  			redirect_to(:controller => 'project', :action => 'list')
  		else
  			flash[:notice] = "Invalid username or password! Try again"
  			redirect_to(:action => :sign_in)
  		end
  	else
  		flash[:notice] = "Invalid username or password! Try again"
  		redirect_to(:action => :sign_in)
  	end
  end

  def logout
  	reset_session
  	redirect_to(:action => :sign_in)
  end

  private
  def user_params(params)
  	return params.permit(:username, :password, :password_confirmation)
  end

end
