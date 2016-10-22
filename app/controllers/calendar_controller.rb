class CalendarController < ApplicationController
  before_action :authenticate_user!

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Time.zone.today
  end
end
