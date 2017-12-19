class ApplicationController < ActionController::Base
  @included_js = []
  @included_css = []
  def hello
    render html: "hello, world!"
  end
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  after_action :restore_resource_buffer
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      #render :json => { :updated? => false, :status => 200, :message => "Please log in!" } unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def restore_resource_buffer
    puts "restore resource buffer"
    Rails.application.config.assets.included_js = []
    Rails.application.config.assets.included_css = []
  end
end
