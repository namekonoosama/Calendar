class CalendarController < ApplicationController
  def leapYear(day)
    lastdays = [31,28,31,30,31,30,31,31,30,31,30,31]
    #閏年を計算
    if day.year%400 == 0
      lastdays[1] = 29
    elsif day.year%100 == 0
      lastdays[1] = 28
    elsif day.year%4 == 0
      lastdays[1] = 29
    end
    @lastday = lastdays[day.mon-1]
  end
  def cale(year, month) #１日の曜日を取得、閏年計算を行う
    y = year.to_i
    m = month.to_i
    require "date"
    @weekdays=["日","月","火","水","木","金","土"]
    @firstday = Date.new(y, m, 1)
    leapYear(@firstday)
  end
  def test
    require "date"
    @today = Date.today
    @day = @today.mday
    cale(@today.year, @today.month)
  end
  def back
    year = params[:year].to_i
    month = params[:month].to_i
    @day = params[:day]
    if month==0
      month=12
      year -= 1
    end
    cale(year,month)
    render template: "/calendar/test"
  end
  def go
    year = params[:year].to_i
    month = params[:month].to_i
    @day = params[:day]
    if month==13
      month=1
      year += 1
    end
    cale(year,month)
    render template: "/calendar/test"
  end
end
