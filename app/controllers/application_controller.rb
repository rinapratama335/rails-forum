class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :pundit_error

    before_action :configure_permited_parameters, if: :devise_controller?

    private
    def pundit_error
        flash[:notice] = "Anda tidak memiliki hak akses ini"
        redirect_to root_path
    end

    def configure_permited_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
