class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit,:update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def new
    @user = User.new
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice]="Dear #{@user.username}, You have Successfully Signed Up"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice]="Dear #{@user.username}, You have Successfully Updated Your Profile"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user ==current_user
    flash[:notice]="Account and articles Associated with your profile are deleted Successully...!"
    redirect_to root_path
  end


  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert]="You can only edit or delete your own profile"
      redirect_to @user
    end
  end
end