class UsersController < ApplicationController

  def index

  end

  def show
    if session["user_id"] == nil or User.find_by(id: session["user_id"]) == nil
      redirect_to "/", notice: "Sign in first!"
      session["user_id"] = nil
      session["host_id"] = nil
    end
  end

  def destroy

  end

  def new

  end

  def create
    user = User.find_by(email: params["email"])
    if user != nil
      redirect_to "/", notice: "This user exists."
    else
      User.create name: params["name"],
                email: params["email"],
                password_digest: BCrypt::Password.create(params["password"]),
                pets: params["pets"],
                is_host: params["is_host"]
    
      redirect_to "/", notice: "Thanks for signing up!"
    end
  end

  def edit
    
  end

  def update
    if session["user_id"] == nil
      redirect_to "/", notice: "You are not allowed to update this user account!"
      return
    end
    
    user = User.find_by(id: params["id"])
    
    user.update name: params["name"],
                email: params["email"],
                password_digest: BCrypt::Password.create(params["password"]),
                pets: params["pets"],
                is_host: params["is_host"]
    
    if not user.is_host
      session["host_id"] = nil
    else
      session["host_id"] = user.id
    end
    
    
    redirect_to "/", notice: "Account was updated."
  end

end
