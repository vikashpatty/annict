export SECRET_KEY_BASE=$(bundle exec rake secret)
bundle exec foreman start
