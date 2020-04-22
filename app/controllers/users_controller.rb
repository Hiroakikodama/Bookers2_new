class UsersController < ApplicationController
  def index
  	@book = Book.new
  	@users = User.all
    @user = User.find(params[:id])
  end

  def show
  	@book = Book.new
  	@books = Book.all
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end

end
