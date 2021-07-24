class PostBooksController < ApplicationController

  def index
    @post_books = PostBook.page(params[:page]).reverse_order
    @post_book = PostBook.new
  end

  def create
    @post_book = PostBook.new(post_book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to post_books_path
  end

  def show
    @post_book = PostBook.find(params[:id])
  end

  def update
  end

  def destroy
    @post_book = PostBook.find(params[:id])
    @post_book.destroy
    redirect_to post_books_path
  end

 private

  def post_book_params
    params.require(:post_book).permit(:book_name, :caption)
  end

end