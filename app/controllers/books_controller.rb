class BooksController < ApplicationController

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = "保存に成功しました！"
      redirect_to book_path(@new_book.id)
    else
      render books_path
    end
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @user = current_user
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "更新に成功しました！"
      redirect_to book_path(book)
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
