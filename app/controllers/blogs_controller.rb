class BlogsController < ApplicationController
    before_action :find_blog, only: [:show, :edit,:update,:destroy]
    
end
