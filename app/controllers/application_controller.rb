class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました"
    user_url(@user.id)
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :nickname, :phone_number, :skill])
  end
end
