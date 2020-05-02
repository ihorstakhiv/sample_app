class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello2
    render html: 'hello my friend'
  end
end
