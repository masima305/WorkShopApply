class AdminController < ApplicationController
    def adindex
        #관리자 메인 페이지
    end
    def subjectset
        #과목 관리 페이지
        @sublist = Subject.all
    
    end
    def userset
        @sublist = Subject.select(:subname).distinct
        
        @flag = (params[:num])
        if @flag == "0" #가입순서순
            @title = "가입순서순"
            @userlist = User.all.order(:id)
        elsif @flag == "1"  #과목별
            @userlistone = User.where.not(subone: "none")
            @userlisttwo = User.where.not(subtwo: "none")
        elsif @flag == "2" #미등록자
            @title = "미등록자"
            @userlist = User.where(subone: 'none',subtwo: 'none').all
        elsif @flag == "3"
            @title = "학번순"
            @userlist = User.all.order(:studentid)
        end
        #유저관리
    end
    def createsubject
        
        newsub = Subject.new
        newsub.subname = params[:title]
        newsub.subteacher = params[:teacher]
        newsub.sublimitone = params[:limitone]
        newsub.sublimittwo = params[:limittwo]
        newsub.subimg = params[:image]
        newsub.subcontent = params[:content]
        newsub.save
    
        redirect_to "/admin/classlist"
    end
    def destroysubject
        if current_user.name == "회장만세!"
            newsub = Subject.find(params[:id])
            newsub.destroy
        end
        redirect_to "/admin/classlist"
    end
    
    def updatesubject
        if current_user.name =="회장만세!"
            newsub = Subject.find(params[:id])
            newsub.subname = params[:title]
            newsub.subteacher = params[:teacher]
            newsub.sublimitone = params[:limitone]
            newsub.sublimittwo = params[:limittwo]
            newsub.subimg = params[:image]
            newsub.subcontent = params[:content]
            newsub.save
        end
        redirect_to "/admin/classlist"
    end
    
    
    def onoff
        @stat = (User.find(current_user.id)).button
    end
    def pushbutton
        change = (User.find(current_user.id))
        if change.button == 0
            change.button = 1
            change.save
        else
            change.button = 0
            change.save
        end
            
        redirect_to "/admin/onoff"
    end
end
