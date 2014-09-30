class TopController < ApplicationController
  def index
    puts ENV[ACCESS_TOKEN]
  end
end
