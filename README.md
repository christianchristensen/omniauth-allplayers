# OmniAuth AllPlayers.com

This gem contains the AllPlayers.com strategy for OmniAuth.

AllPlayers.com uses the OAuth 1.0 flow, you can read about it here: http://develop.allplayers.com/

## How To Use It

Usage is as per any other OmniAuth 1.0 strategy. So let's say you're using Rails, you need to add the strategy to your `Gemfile`:

    gem 'omniauth-allplayers'

You can pull them in directly from github e.g.:

    gem 'omniauth-allplayers', :git => 'https://github.com/allplayers/omniauth-allplayers.git'

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :allplayers, "consumer_key", "consumer_secret"
    end


## Note on Patches/Pull Requests

- Fork the project.
- Make your feature addition or bug fix.
- Add tests for it. This is important so I don’t break it in a future version unintentionally.
- Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
- Send me a pull request. Bonus points for topic branches.

