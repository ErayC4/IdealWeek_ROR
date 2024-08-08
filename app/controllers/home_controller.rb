class HomeController < ApplicationController
  def index
  end

  def todays_mission
    @timeblocks = Timeblock.all

    require 'date'
    today = Time.now
    weekday = today.strftime("%A")
    @dayIndex = getDayIndex(weekday)
  end

  def getDayIndex(weekday)
    case weekday
      when "Monday" 
        0
      when "Tuesday" 
        1
      when "Wednesday" 
        2
      when "Thursday" 
        3
      when "Friday" 
        4
      when "Saturday" 
        5
      when "Sunday" 
        6
      end
  end
end
