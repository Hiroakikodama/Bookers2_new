class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]

  def index
  	@book = Book.new
  	@users = User.all
    @user = current_user
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @users = User.all
    @book = Book.new
    @books = @user.books
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user)
      flash[:notice] = "error"
    end
  end
end
