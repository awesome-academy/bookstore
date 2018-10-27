class BlogsController < ApplicationController

  def show
    @blog = Blog.find_by id: params[:id]
  end

  def new
    @blog = current_user.blogs.build if logged_in?
  end

  def index
    @blogs = Blog.paginate(page: params[:page] ,:per_page => 5)
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = t ".created_sucess"
      redirect_to blogs_path
    else
      render "static_pages/home"
    end
  end

  private
     def blog_params
      params.require(:blog).permit(:title, :body, :author, :date, :description, :auth_link)
    end

end
