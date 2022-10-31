# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        books_path # ログイン後に遷移する画面
      end

      def after_sign_out_path_for(resource)
        new_user_session_path # ログアウト後に遷移する画面
      end
end
