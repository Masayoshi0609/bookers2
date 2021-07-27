class UsersController < ApplicationController


   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    render show
   end

 def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
 end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
