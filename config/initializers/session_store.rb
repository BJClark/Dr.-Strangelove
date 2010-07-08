# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_strangelove_session',
  :secret      => '3c078d216ed2611a10e9aba47d476e5699c63af724d00ca31e9f3b2384cb18d82bdbcfd2f7099f27e8c855c01ad8aba790dbbf96ee41b2a01d0d78b051a0bc34'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
