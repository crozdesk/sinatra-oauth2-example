# sinatra-oauth2-example

Crozdesk OAuth example integration for Sinatra.

## Running

Edit `application.rb` and make sure you replace `PROVIDER_KEY` and `PROVIDER_SECRET` with the keys for your Crozdesk app.

Also, make sure to change your callback url in your Crozdesk app's settings to
```
http://localhost:3000/users/auth/crozdesk/callback
```
before you continue.

You can get the consumer keys and change the callback url here: https://crozdesk.com/users/developers

To start the app run the following:
```
bundle install
bundle exec ruby application.rb -p3000
```

Now you should be ready to go, visit http://localhost:3000 and click the login button.
