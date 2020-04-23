class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :pundit_error

    private
    def pundit_error
        flash[:notice] = "Anda tidak memiliki hak akses ini"
        redirect_to root_path
    end
end
