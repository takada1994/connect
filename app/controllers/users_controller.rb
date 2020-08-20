class UsersController < ApplicationController
before_action :set_user, only: %i[show edit update destroy]
  
  def index
    @users = User.all.order(id: :desc)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      flash[:notice] = "登録しました"
      redirect_to(users_path)
    else
      render(new_users_path)
    end
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end