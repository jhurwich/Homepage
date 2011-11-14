# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  # Checks UserAgent
  def is_chrome?
    ua = request.user_agent
    return false if ua.nil?
    return true if ua.downcase.index('chrome')
    
    false
  end
   
  # Sets the respond_to format to chrome if chrome
  def set_chrome_format
    if !request.xhr? and is_chrome?
      request.format = :chrome
    end
  end
end
