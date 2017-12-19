require 'rails_helper'

RSpec.describe "routing to welcome", :type => :routing do
  it "routes / to welcome#index for index page" do
    expect(:get => "/").to route_to(
      :controller => "welcome",
      :action => "index"
    )
  end

  it "routes /signup to users#new for sign up page" do
    expect(:get => "/signup").to route_to(
      :controller => "users",
      :action => "new"
    )
  end

  it "routes /certificat to certificate_relationships#certificat" do
    expect(:get => "/certificat").to route_to(
      :controller => "certificate_relationships",
      :action => "certificat"
    )
  end

  it "routes /chat to messages#show for showing the chat page" do
    expect(:get => "/chat").to route_to(
      :controller => "messages",
      :action => "show"
    )
  end

  it "routes /chat/convs to messages#show_convs for showing all the available conversations" do
    expect(:get => "/chat/convs").to route_to(
      :controller => "messages",
      :action => "show_convs"
    )
  end
end
