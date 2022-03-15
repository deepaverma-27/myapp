class SessionsController < ApplicationController

  def new;
  end

  def create
    user = User.find_by(email: params[:email])
    byebug
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to sign_in_path, notice: 'Logged Out'
   end
 end