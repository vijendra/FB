# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_formbuilder_session',
  :secret      => 'ba12409347fdeca4b1dae84d1a688fab0adae660c486fd68b994ec359abae0d53d765cca722a68d18a5929fef3af5dffdc83a8fc7d409e246324d948036c912e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
