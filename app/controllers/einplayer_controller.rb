class EinplayerController < ApplicationController

  def index
    @user = User.new
    respond_to do |format|
      format.html
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

end
