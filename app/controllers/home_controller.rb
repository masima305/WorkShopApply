class HomeController < ApplicationController
  def index
    @userlist = User.all
  end
  def registerstat
    @sublist = Subject.all.order(:id)
    @userinfo = User.where(name: current_user.name)
    signal = User.where(studentid: "2012045967").take.button

    if signal == 0
      @flag = "OFF"
    elsif signal == 1
      @flag = "ON"
    elsif signal == 3
      @flag = "찾을 수 없음"
    end
    
  
  
  end
  
  def quit
    userinfo = User.find(current_user.id)
    
    tynum = (params[:clanum])
    if tynum == "1"
      subject=Subject.where(subname: current_user.subone).take
      subject.substudentone = subject.substudentone-1
      if subject.substudentone < 0
        redirect_to "/home/error/2"
      end
      subject.save  
      
      userinfo.subone = "none"
      userinfo.save
    
    elsif tynum == "2"
      subject=Subject.where(subname: current_user.subtwo).take
      subject.substudenttwo = subject.substudenttwo-1
      if subject.substudenttwo < 0
        redirect_to "/home/error/2"
      end
      subject.save
    
      userinfo.subtwo = "none"
      userinfo.save
    end
    redirect_to"/home/stat"
  end
  
  def enrollone
      subject=Subject.find(params[:id])
      userinfo = User.find(current_user.id)
      flag = User.where(studentid: "2012045967").take.button
    if flag == 1
      if subject.sublimitone > subject.substudentone
        subject.substudentone = subject.substudentone+1
        userinfo.subone = subject.subname
        subject.save
        userinfo.save
        redirect_to"/home/stat"
      elsif 
        redirect_to "/home/error/0"
      end
    elsif flag == 0
      redirect_to "/home/error/1"
    else 
      redirect_to "home/error/2"
    end
  end
  
  def enrolltwo
      subject=Subject.find(params[:id])
      userinfo = User.find(current_user.id)
      flag = User.where(studentid: "2012045967").take.button
      
    if flag == 1
      if subject.sublimittwo > subject.substudenttwo
        subject.substudenttwo = subject.substudenttwo+1
        userinfo.subtwo = subject.subname
        subject.save
        userinfo.save
        redirect_to"/home/stat"
      elsif 
        redirect_to "/home/error/0"
      end
    else
      redirect_to "/home/error/1"
    end
  end
  
  def error
    @remote = (params[:num])
    if @remote == '0'
      @content = "신청정원이 초과되었습니다."
    elsif @remote == '1'
      @content = "아직 신청접수 시간이 아닙니다"
    elsif @remote == '2'
      @content = "예기치 못한 에러가 발생하였습니다." #subject count error
    elsif @remote == '3'
      @content = "온오프 문제"
    end
  end
end
