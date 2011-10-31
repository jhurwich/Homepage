require 'aws/s3'
class TapedeckController < ApplicationController

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
      redirect_to_s3("tapedeck.crx")
    else
      render :action => "index"
    end
  end
  
  def update
    redirect_to_s3("update.xml")
  end

  def thisisanupdatepath
    redirect_to_s3("tapedeck.crx")
  end

  def redirect_to_s3(objectName)
    AWS::S3::Base.establish_connection!(
      :access_key_id     => 'AKIAILIWN7VC34553LVA',
      :secret_access_key => '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'
    )
    download_url = AWS::S3::S3Object.url_for(objectName,
                                             "tape-deck",
                                             :expires_in => 2 * 60) # in seconds
    redirect_to download_url
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
