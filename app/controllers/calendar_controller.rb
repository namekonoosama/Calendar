class CalendarController < ApplicationController
  def leapYear(firstday)
    lastdays = [31,28,31,30,31,30,31,31,30,31,30,31]
    #閏年を計算
    if firstday.year%400 == 0
      lastdays[1] = 29
    elsif firstday.year%100 == 0
      lastdays[1] = 28
    elsif firstday.year%4 == 0
      lastdays[1] = 29
    end
    @lastday = lastdays[firstday.mon-1]
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
    @day = @today.mday.to_i
    cale(@today.year, @today.month)
  end

  def back
    year = params[:year].to_i
    month = params[:month].to_i
    @day = params[:day].to_i
    if month-1==0
      month=12
      year -= 1
    end
    cale(year,month-1)
    if @day==0
      @day=@lastday
      month -= 1
    elsif month==0
      month=12
      year -= 1
    end
    cale(year,month)
    render template: "/calendar/test"
  end

  def go
    year = params[:year].to_i
    month = params[:month].to_i
    @day = params[:day].to_i
    cale(year,month)
    if @day>@lastday
      @day = 1
      month += 1
    elsif month==13
      month=1
      year += 1
    end
    cale(year,month)
    render template: "/calendar/test"
  end
end
