class BlogsController < ApplicationController
    before_action :find_blog, only: [:show, :edit,:update,:destroy]
    before_action :redirect_if_not_logged_in, only: [:new, :edit]
    before_action :verify_current_user, only: [:edit, :destroy]

    def index
        @blogs = Blog.paginate(page: params[:page], per_page: 3)
    end
    def show
    end

    def new
        @blog = current_user.blogs.build
    end

    def create
        @blog = current_user.blogs.build(blog_params)
        if @blog.save
            redirect_to blog_path(@blog)
        else
            render :new
        end

    end

    def edit
        
    end

    def update
        if @blog.update(blog_params)
            redirect_to blog_path(@blog)
        else 
            render :edit
        end

    end

    def destroy
        @blog.destroy
        redirect_to root_path

    end

    private

    def blog_params
        params.require(:blog).permit(:title, :content, :user_id)
    end

    def find_blog
        @blog = Blog.find_by(id: params[:id])
    end

    def verify_current_user
        if @blog.user_id != current_user.id && !current_user.admin?
            redirect_to user_path(current_user)
        end
    end

end
