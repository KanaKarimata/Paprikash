# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_deleted_user, only: [:create]
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: 'ゲストユーザーとしてログインしました！'
  end

  protected

  def reject_deleted_user
    @user = User.find_by(email: params[:user][:email])
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.is_deleted == true ))
        redirect_to new_user_registration_path
      end
    end
  end

  def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
