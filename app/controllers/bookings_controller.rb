class BookingsController < ApplicationController

  def index

  end

  def show
    if session["user_id"] == nil
      redirect_to "/", notice: "You are not allowed to book this posting!"
      return
    end
    posting = Posting.find_by(id: params["id"])
    if posting == nil
      redirect_to "/", notice: "This posting does not exist!"
    end
  end

  def destroy

  end

  def new

  end

  def create
    if session["user_id"] == nil
      redirect_to "/", notice: "You are not allowed to book this posting!"
      return
    end
    posting = Posting.find_by(id: params["id"])
    if posting == nil
      redirect_to "/", notice: "This posting does not exist!"
      return
    end
    
    if session["user_id"] == posting.host_id
      redirect_to "/", notice: "You cannot book your own posting!"
      return
    end
    
    createBooking = true
    startDate = Date.parse(Date.parse(params["start_date"]).strftime("%y-%m-%d"))
    endDate = Date.parse(Date.parse(params["end_date"]).strftime("%y-%m-%d"))
    for booking in Booking.all
      if booking.posting_id == posting.id and 
          (startDate < Date.parse(booking.end_date.strftime("%y-%m-%d")) or
            endDate > Date.parse(booking.start_date.strftime("%y-%m-%d")))
        createBooking = false
        break
      end
    end
    if createBooking
      Booking.create start_date: startDate,
                end_date: endDate,
                user_id: session["user_id"],
                host_id: posting.host_id,
                posting_id: params["id"]
      redirect_to "/", notice: "Booking completed!"
    else
      redirect_to "/postings/", notice: "Booking could not be completed. Date was not available."
    end
  end

  def edit

  end

  def update
    
  end

end
