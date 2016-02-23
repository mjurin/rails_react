class SessionsController < ApplicationController
  def new
    raise "yey USER IS LOGGED!!!! !!!!" + session[:user_id].to_json if session.key?(:user_id)
  end
end
