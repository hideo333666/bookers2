class BooksController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
   
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
    @user = User.find(@book.user.id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] =" You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

   def book_params
    params.require(:book).permit(:title, :body, :user_id)
   end
   
   def user_params
    params.require(:user).permit(:profile_image)
   end
   
   def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
   end


end
