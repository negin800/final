class SessionsController < ApplicationController
    
  def destroy
    session["user_id"] = nil
    session["host_id"] = nil
    redirect_to "/", notice: "Thank you for using PetBnB."
  end
  
  def create
    user = User.find_by(email: params["email"])
    if user == nil
      redirect_to "/", notice: "Please sign up first as a user or as a host."
      return
    else
      if user.authenticate(params["password"])
        session["user_id"] = user.id
        if user.is_host 
          session["host_id"] = user.id
        end
        redirect_to "/", notice: "Hello, #{user.name}"
      else 
        redirect_to "/", notice: "Wrong password."
      end
    end
  end
end