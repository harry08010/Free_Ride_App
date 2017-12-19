require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do 
    @user = FactoryGirl.build(:user)
  end

  it "has a valid factory" do
      expect(@user).to be_valid
  end
  
  #check blank validation
  it "is invalid without first_name" do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors[:first_name]).to include("can't be blank")
  end
  it "is invalid without last_name" do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors[:last_name]).to include("can't be blank")
  end
  it "is invalid without nickname" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors[:nickname]).to include("can't be blank")
  end
  it "is invalid without email" do
    @user.email = nil
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end
  it "is invalid without password" do
    @user.password = nil
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end
  it "is invalid without phone" do
    @user.phone = nil
    @user.valid?
    expect(@user.errors[:phone]).to include("can't be blank")
  end
  it "is invalid without gender" do
    @user.gender = nil
    @user.valid?
    expect(@user.errors[:gender]).to include("can't be blank")
  end  
  
  #check abnormal forms
  it "is invalid with too long first_name" do
  invalid_name = %w(
		pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
	)
  invalid_name.each do |name|
	  @user.first_name = name
	  expect(@user).not_to be_valid
	end
	end
	
  it "is invalid with too long last_name" do
  invalid_name = %w(
		pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
	)
  invalid_name.each do |name|
	  @user.last_name = name
	  expect(@user).not_to be_valid
	end
	end
  
  it "is invalid with wrong email forms" do
  invalid_email = %w(
		ppppppppppppppppppppppppppp
		test.text.com
		fool@test..com
	)
  invalid_email.each do |email|
	  @user.email = email
	  @user.valid?
	  expect(@user.errors[:email]).to include("is invalid")
	end
	end
	
  it "is invalid with too short password" do
  invalid_password = %w(
		pppp
		123
		1uie
	)
  invalid_password.each do |password|
	  @user.password = password
	  @user.valid?
	  expect(@user).not_to be_valid
	end
	end
end
