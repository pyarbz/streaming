# encoding: utf-8

class User < ActiveRecord::Base
  # playsとbookmarksテーブル名で使われる
  has_many :plays, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # githubのOauth情報とDBを比較する。DBに登録されてなかったら登録する。
  def self.find_for_github_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = User.create( name: auth.extra.raw_info.login,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.email,
                          token: auth.credentials.token,
                          password: Devise.friendly_token[0, 20])
    end
    return user
  end
end
