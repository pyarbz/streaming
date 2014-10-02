# encoding: utf-8

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    # githubAPIからメンバーリストを取得
    member_lists = OmniauthCallbacksHelper.github_member_list()

    # githubOauthからユーザー情報を取得
    oauth_data = request.env['omniauth.auth']
    @user_name = OmniauthCallbacksHelper.github_oauth_user(oauth_data.to_json)

    # ユーザーがメンバーリストに含まれている場合のみ許可
    if member_lists.include?(@user_name)

      # DB内にユーザー情報が含まれていればログイン、含まれていなければ認証を作成
      @user = User.find_for_github_oauth(oauth_data)
      # if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
      # else
        # session["devise.github_data"] = request.env["omniauth.auth"]
        # redirect_to '/top'
      # end
    else
      redirect_to 'https://github.com/404'
    end
  end
end
