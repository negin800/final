class PostingsController < ApplicationController

  def index
    #postings = Posting.all
  end

  def show
    posting = Posting.find_by(id: params["id"])
    if posting == nil
      redirect_to "/", notice: "This posting does not exist!"
    end
  end

  def destroy
    Posting.delete(params["id"])
    redirect_to "/postings", notice: "Posting deleted!"
  end

  def new
    if session["host_id"] == nil
      redirect_to "/", notice: "You are not allowed to create a new posting!"
    end
  end

  def create
    if session["host_id"] == nil
      redirect_to "/", notice: "You are not allowed to create a new posting!"
      return
    end
    Posting.create title: params["title"],
                price: params["price"],
                host_id: session["user_id"],
                summary: params["summary"],
                location: params["location"],
                photo_url: params["photo_url"]

    redirect_to "/postings", notice: "Thanks for adding a posting!"
  end

  def edit

  end

  def update
    if session["host_id"] == nil
      redirect_to "/", notice: "You are not allowed to update this posting!"
      return
    end
    posting = Posting.find_by(id: params["id"])
    
    posting.update title: params["title"],
                summary: params["summary"],
                location: params["location"],
                photo_url: params["photo_url"],
                price: params["price"]

    redirect_to "/postings/#{posting.id}", notice: "Posting updated."
  end
end 
