class BookCommentsController < ApplicationController

	def create
	 @book_detail = Book.find(params[:book_id])
	 @comments = @book_detail.book_comments
	 @comment = BookComment.new(book_comment_params)
	 @comment.book_id = @book_detail.id
	 @comment.user_id = current_user.id
	 @comment.book_id = @book_detail.id
	 @comment.save
	 #if @comment.save
	 #	render :create
	 #end
	end

	def destroy
	@book_detail = Book.find(params[:book_id])
	@comments = @book_detail.book_comments
	 BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
	 #render :destroy
	end


	private

	def book_comment_params
		params.require(:book_comment).permit(:comment, :book_id, :user_id)
	end

end

