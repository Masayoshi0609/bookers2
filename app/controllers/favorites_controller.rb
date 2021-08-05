class FavoritesController < ApplicationController

	def create
	@book_fav = Book.find(params[:book_id])
	favorite = current_user.favorites.new(book_id: @book_fav.id)
	favorite.save
	redirect_back fallback_location: root_path

	end

	def destroy
	@book_fav = Book.find(params[:book_id])
	favorite = current_user.favorites.find_by(book_id: @book_fav.id)
	favorite.destroy
	redirect_back fallback_location: root_path

	end

end
