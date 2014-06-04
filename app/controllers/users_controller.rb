class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end 
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
       flash[:success] = "Welcome to the Sample App!"
	  redirect_to @user
    else
      render 'new'
    end
  end
  
  def new  
	@user = User.new
  end
  
   private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end  
end
