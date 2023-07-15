class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   flash[:notice] = 'You have updated user successfully.'

   if @user.update(user_params)
     redirect_to user_path(@user.id)
   else
     render :edit
   end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(current_user.id)
    end
  end

end
