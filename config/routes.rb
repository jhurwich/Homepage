ActionController::Routing::Routes.draw do |map|

  map.download '', :controller => 'einplayer', :action => 'download',
              :conditions => { :method => :post }

  map.connect 'einplayer.:format', :controller => 'einplayer'

  map.connect ':action.:format', :controller => 'einplayer'
  map.connect 'einplayer/:action.:format', :controller => 'einplayer'

end
