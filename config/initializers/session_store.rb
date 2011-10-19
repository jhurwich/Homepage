# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jordanhurwich_session',
  :secret      => 'e4267f3d89aa30ee2539d33f971f2eee143266f550adf10e27b8791db079059a244193dccbda2cf99ffb3d3c671ca0c3337874678105f9835a31c95aa32dd379'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
