class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def edit
      @user = current_user
    end
    def update
      @user = current_user
      if @user.update_attributes(user_params)
        # Handle a successful update
      else
        render 'edit'
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name)
    end
   

  end
  