# encoding: utf-8

class TopController < ApplicationController
  #ログインしている時しかアクセスできないようにする
  before_filter :authenticate_user!

  def index
  end
end
