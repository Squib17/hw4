class UsersController < ApplicationController
  def show
    @user = User.find_by({"id" => params["id"]})
  end

  def new
  end

  def create
    @user = User.find_by("email" => params["email"])
    if @user
      flash["notice"] ="A user with the same ID exist. Either use another email Id or Go to login page"
      redirect_to "/users/new"
    else
      @user = User.new
      @user["username"] = params["username"]
      @user["email"] = params["email"]
      @user["password"] = result = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/login"
    end
  end
end



