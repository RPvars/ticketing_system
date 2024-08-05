class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.administrator?
      @tickets = Ticket.all.order(created_at: :desc)
    else
      @tickets = Ticket.where(requester_email: current_user.email).order(created_at: :desc)
    end
  end
end
