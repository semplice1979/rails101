
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
before_filter :configure_permitted_parameters, if: :devise_controller?  
def login_required
  if current_user.blank?
    respond_to do |format|
      format.html {
      authenticate_user!
      }
      format.js{
      render :partial => "common/not_logined"
      }
      format.all {
      head(:unauthorized)
      }
    end
  end
end
end

private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end
  def priority_conv(value)
    case value
      when 1 then conv = "Critical"
      when 2 then conv = "Major"
      when 3 then conv = "Minor"
      when 4 then conv = "Suggest"
    end
    return conv
  end 
