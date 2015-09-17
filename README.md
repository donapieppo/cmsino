# Cmsino

Ruby on rails gem (Rails Engine) for developers to add small cms capabilities to their application. Not usable now unless you want to **help** developing :-)

Authorization is done with https://github.com/ryanb/cancan
but easy to change.

## Installation

Add theses lines to your application's Gemfile:

    gem 'cmsino', :git => 'git@github.com:donapieppo/cmsino.git'

And then execute:

    $ bundle update
    $ rails g cancan:ability
    $ bundle exec rake cmsino_engine:install:migrations # populates migrations
    $ bundle exec rake db:migrate

To configure use `config/initializers/cmsino.rb` as

    Cmsino::Conf.setup do |config|
      config.locales = ['it', 'en', 'es']
    end

Cmsino gets the locale from I18n.locale. You can see http://guides.rubyonrails.org/i18n.html
for Rails Internationalization.

## Usage

Include `CmsinoHelper` in `app/controllers/application_controller.rb` and
for `CanCan` provide a `current_user` method in the controller and give 
ability to manage Cmsino::Content.

For example in `app/controllers/application_controller.rb`

```ruby
class ApplicationController < ActionController::Base
  [...]

  include CmsinoHelper

  def current_user
    User.new(:cmsino_user => session[:cmsino_user])
  end 
end
```

and in `app/models/ability.rb`

```ruby
  [...]
    can :manage, Cmsino::Content

```

Of course in real cases you use something like 
https://github.com/plataformatec/devise to handle
current_user

Include cmsino/cmsino in your stylesheet and javascript
assets: in `app/assets/stylesheets/application.css`
```css
  *= require cmsino/cmsino
```
and in `app/assets/javascripts/application.js`
```javascript
  //= require cmsino/cmsino
```


If you want to provide editable content to `home#index`
update the file `config/cmsino.yml` with 

```yaml
home: Home Page
```

add the tag `editable_page` to 
`app/controllers/home_controller.rb`

```ruby
class HomeController < ApplicationController
  def index
    editable_page(:home)
  end
end
```

and `editable_content` in the view `app/views/home/index.html.erb`

```erb
<h2>Main content</h2>
<%= editable_content(:main) %>
```

When you visit /home for the first time the *content* named
:main for the page :home and the locale "I18n.locale"
is created in the database as an empty string.

When authenticated (see cancan) you get an editable 
form (a http://xing.github.io/wysihtml5 styled form for now).

See https://github.com/donapieppo/cmsino/wiki/Usage for details
and https://github.com/donapieppo/cmsino-example for example.

## Why

For those searching for a tiny cms which allows your users to change 
only the contents (snippets) leaving you, the rails developer and web designer, 
with your editor (vim?), your rails gems and no web interface.

When https://github.com/geraudmathe/Locomotive-fundamentals says "Developing a LocomotiveCMS site should not require Ruby on Rails knowledge" we say "Developing site with Cmsino require Ruby on Rails knowledge". 

## TODO

Use https://github.com/flavorjones/loofah for cleaning html posted by authenticated
user.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
