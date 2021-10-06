class UsersController < ApplicationController
  # before_action :set_user, only: %i[edit show update destroy]
  # before_action :require_user?, except: %i[new index create]
  # before_action :same_user, only: %i[edit update destroy]
  #
  # def index
  #   @users = User.paginate(page: params[:page], per_page: 5)
  # end
  #
  # def new
  #   @user = User.new
  # end
  #
  # def edit; end
  #
  # def show
  #   @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  # end
  #
  # def create
  #   @user = User.create(user_params)
  #   if @user.save
  #     session[:user_id] = @user.id
  #     flash[:notice] = "Welcome to Alpha Blog #{@user.username}, you have successfully signed up."
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end
  #
  # def update
  #   if @user.update(user_params)
  #     flash[:notice] = 'User was successfully updated.'
  #     redirect_to users_path
  #   else
  #     render 'edit'
  #   end
  # end
  #
  # def destroy
  #   @user.destroy
  #   flash[:notice] = 'User and associated articles are removed successfully'
  #   session[:user_id] = nil
  #   redirect_to login_path
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:username, :email, :password)
  # end
  #
  # def set_user
  #   @user = User.find(params[:id])
  # end
  #
  # def same_user
  #   return if current_user == @user || admin_user?
  #
  #   flash[:alert] = "You are not authorised to edit/delete other user's profile"
  #   redirect_to @user
  # end

end
