class EmotionsController < ApplicationController
  def create
    if params[:recipent_type] == "Book"
    @recipent = Book.find_by id: params[:recipent_id]
    path = book_path(@recipent)
    elsif params[:recipent_type] == "Blog"
    @recipent = Blog.find_by id: params[:recipent_id]
    path = blog_path(@recipent)
    else
      flash[:danger] = t ".error"
    end

    current_user.like @recipent
    respond_to do |format|
      format.html { redirect_to path }
      format.js
    end
  end

  def destroy
    @recipent = Emotion.find_by(params[:id]).recipent
    path = if @recipent.class.to_s == "Book"
           book_path(@recipent)
           else blog_path(@recipent)
           end

    current_user.unlike @recipent
    respond_to do |format|
      format.html { redirect_to path }
      format.js
    end
  end

end
