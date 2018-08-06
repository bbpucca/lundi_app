class SessionsController < ApplicationController


    def new
    end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end

    # Logs in the given user.
def log_in(user)
  session[:user_id] = user.id
end



def log_out
  session.delete(:user_id)
  @current_user = nil
end




def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end


def logged_in?
  !current_user.nil?
end

    def destroy
    end
  end
