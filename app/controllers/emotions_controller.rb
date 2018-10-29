class EmotionsController < ApplicationController
  def create
    @book = Book.find_by id: params[:book_id]
    current_user.like @book
    respond_to do |format|
      format.html { redirect_to book_path(@book) }
      format.js
    end
  end

  def destroy
    @book = Emotion.find_by(params[:id]).book
    current_user.unlike @book
    respond_to do |format|
      format.html { redirect_to book_path(@book) }
      format.js
    end
  end

end
