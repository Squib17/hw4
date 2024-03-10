class SessionsController < ApplicationController
  def new
  end

  def create
    #Trying to find the user by their unqiue identifier
    @user = User.find_by({"email" => params["email"]})
    #If they exsit, then checking if they know their password correctly
    if @user !=nil
      #Then we checking their password matched with the stored password -> Login successfully
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] ="Welcome, #{@user["username"]}"
        redirect_to "/places"      
      else
        flash["notice"] ="Try Again."
        redirect_to "/login"
      end
    else
      flash["notice"] ="Try Again."
      redirect_to "/login"
    end


  end

  def destroy
    # logout the user
    session["user_id"] = nil
    redirect_to "/login"
    flash["notice"] = "Goodbye."

  end
end
  