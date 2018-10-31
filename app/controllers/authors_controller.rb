class AuthorsController < ApplicationController
  def index
    @search_authors = Author.order_by_name params[:term]
    render json: @search_authors.map(&:name)
  end
end
