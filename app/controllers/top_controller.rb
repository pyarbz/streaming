class TopController < ApplicationController
  def index
    @afscs = ENV[ACCESS_TOKEN]
  end
end
