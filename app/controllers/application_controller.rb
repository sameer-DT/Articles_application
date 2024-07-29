class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    # before_action :redirect_if_logged_in

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
      end

    # def redirect_if_logged_in
    #     if logged_in? && request.path == root_path
    #     redirect_to articles_path
    #     end
    # end

    def require_user
        if !logged_in?
          flash[:message] = "You must be Logged in"
          redirect_to login_path
        end
    end
end
