class BlogsController < ApplicationController
    before_action :find_blog, only: [:show, :edit,:update,:destroy]

    def show
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(blog_params)
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

    end

    private

    def blog_params
        params.require(:blog).permit(:title, :description, :user_id)
    end

    def find_blog
        @blog = Blog.find_by(id: params[:id])
    end

end
