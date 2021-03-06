class UsersController < ApplicationController


  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end


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
     if @user == current_user
       render :edit
     else
       redirect_to user_path(current_user.id)
     end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
