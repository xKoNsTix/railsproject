class SessionsController < Devise::SessionsController
    def destroy
      super
      redirect_to root_path
    end

    def login
        super
        redirect_to root_path
      end
  end