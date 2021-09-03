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
end
