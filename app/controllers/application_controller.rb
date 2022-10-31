# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :authenticate_user! # ユーザがログインしていない場合はログインページにリダイレクト
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postcode, :address, :profile])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :postcode, :address, :profile])
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def after_sign_in_path_for(resource)
        books_path # ログイン後に遷移する画面
      end

      def after_sign_out_path_for(resource)
        new_user_session_path # ログアウト後に遷移する画面
      end
end
