class HomeController < ApplicationController
  def index
    @events = Event.active.order_by_date
  end
end
