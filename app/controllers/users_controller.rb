class UsersController < ApplicationController

  def show
    @new_book = Book.new
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def index
    @new_book = Book.new
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報が更新されました！"
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
