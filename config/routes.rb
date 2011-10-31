ActionController::Routing::Routes.draw do |map|

  map.download '', :controller => 'tapedeck', :action => 'download',
              :conditions => { :method => :post }

  map.connect 'tapedeck.:format', :controller => 'tapedeck'

  map.connect ':action.:format', :controller => 'tapedeck'
  map.connect 'tapedeck/:action.:format', :controller => 'tapedeck'

end
