class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@bbok = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.userid = current_user.id
  	@book.save
  	redirect_to book_path[:id]

  end

  def show
  end

  def edit
  end
end
