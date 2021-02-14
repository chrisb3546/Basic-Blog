class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit,:update,:destroy]

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

    end

    def destroy
        #if logged in

    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
