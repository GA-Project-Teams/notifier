notifier
========

Front Desk Notification App powered by Ruby on Rails, sendgrid, heroku, twilio and postgres

Installation
============

To get setup:

Set your environmental variables, message.rb

```ruby
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']
```

In the config block in the production.rb environment, set the environment variables to whatever prodvider you want to use. Example below is for sendgrid

```ruby
  config.action_mailer.smtp_settings = {
      address: "smtp.sendgrid.net",
      port: 587,
      domain: "ga-notifier.herokuapp.com",
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: ENV["SENDGRID_USERNAME"],
      password: ENV["SENDGRID_PASSWORD"]
    }
```

Update your seed file accordingly, example below:

```ruby
	role = Role.create(name: 'admin')
	User.create(email: 'test@test.com', first_name: 'test', last_name: 'admin', company_name: 'GA', password: 'test123', password_confirmation: 'test123', role_ids: role.id)
	User.create(email: 't@test.com', first_name: 'test', last_name: 'admin', company_name: 'GA', password: 'asd', password_confirmation: 'asd', role_ids: '')
	User.create(email: 'a@test.com', first_name: 'Michael', last_name: 'admin', company_name: 'GA', password: 'asd', password_confirmation: 'asd', role_ids: '')
```

Run and let the magic happen

```ruby
rake db:setup
```

Environment Setup Instructions
==============================

Please view the [environment setup wiki](https://github.com/GA-Project-Teams/notifier/wiki/Environment-Setup-Process "Setup wiki") on how to get up and running with rails/ruby and using postgresql on OSX

Deployments
===========

The [heroku san](https://github.com/fastestforward/heroku_san) has been added to the project to assist in heroku deployments.  When a deployment is ready, simply type:

```sh
   rake production deploy
```

Contributors
============

- [Peter To](https://github.com/peterto)
- [Michael Green](https://github.com/greenm2)
- [Jason Culler](http://www.behance.net/jasonculler)

Mentors and cool dudes
======================

- [Michael Hamrah](https://github.com/mhamrah)
- [Aaron Smyth](https://github.com/aas395)
- [Adrian Ryan](https://github.com/1point618)
