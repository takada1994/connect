class UsersController < ApplicationController
before_action :set_user, only: %i[show edit update destroy]
  
# ユーザー一覧
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
      flash[:notice] = "登録が完了しました"
      redirect_to(users_path)
    else
      render(new_users_path)
    end
  end

  def update
    @user.assign_attributes(params[:user])
    if @user.save
      flash[:notice] = "登録情報を変更しました"
      redirect_to(users_path)
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "ユーザー情報を削除しました"
    redirect_to(users_path)
  end

  #検索
  def search
    @users = User.search(params[:q])
    render "index"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end