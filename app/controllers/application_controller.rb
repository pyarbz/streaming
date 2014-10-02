# encoding: utf-8

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # ログイン時のリダイレクト先(Topページ)
  def after_sign_in_path_for(resource)
    '/top'
  end

  # ログアウト時のリダイレクト先(Welcomeページ)
  def after_sign_out_path_for(resource)
    '/'
  end

  # 認証時のリンク先を、登録画面からgithubOauthにオーバーライド
  def authenticate_user!
    session[:user_return_to] = env['PATH_INFO']
    redirect_to user_omniauth_authorize_path(:github) unless user_signed_in?
  end
end
