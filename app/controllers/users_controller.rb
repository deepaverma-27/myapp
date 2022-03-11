class UsersController < ApplicationController
  before_action :require_user_logged_in!, only:[:show,:index,:update]

  def index
    if params[:search_key]
      @users = User.search(params)
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    # @user =User.find(params[:id])
    @user = @current_user
  end

  def create 
    @user = User.new(user_params)
     # @user.role = 'normaluser'
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'user created successfully'
      redirect_to root_path, notice: 'signup successfully'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'user updated successfully'
      redirect_to (@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user =User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:name,:email,:gender,:role,:password_digest,:password,:password_confirmation)
  end
end
