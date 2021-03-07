class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit,:update,:destroy]
    before_action :redirect_if_not_logged_in, only: [:new, :edit]

    def index
        @users = User.all
    end

    def show
    end

    def new
        #if logged in
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        #if logged in
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            render :edit
        end

    end

    def destroy
        #if logged in
        @user.destroy 
        redirect_to root_path

    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
