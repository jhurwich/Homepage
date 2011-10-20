class EinplayerController < ApplicationController

  def index
    @user = User.new
    
    set_chrome_format
    respond_to do |format|
      format.chrome { render :action => 'index' }
      format.html { render :action => 'chromeonly' }
      format.xml { update() }
      format.crx { download() }
    end
  end

  def download
    @user = User.new(params[:user])
    if @user.save
      send_file '/home/jhurwich/webfolder/jordanhurwich/assets/einplayer.crx',
                :type=>"application/x-chrome-extension"
    else
      render :action => "index"
    end
  end
  
  def update
    send_file '/home/jhurwich/webfolder/jordanhurwich/assets/update.xml',
              :type=>"application/xml" 
  end

  def thisisanupdatepath
    send_file '/home/jhurwich/webfolder/jordanhurwich/assets/einplayer.crx',
              :type=>"application/x-chrome-extension"
  end

  def users    
    if params.nil? or params[:login].nil?
      render :action => 'users'
      return
    end
    
    puts " params[:login][:password] " + params[:login][:password] 
    if params[:login][:password] == "jordan23"
      @users = User.all
    end
    render :action => 'users'
  end

end
