# Cmsino

Cms rails gem (Rails Engine) for developers in its smallest form possible. Not usable now unless
you want to help developing :-)

## Installation

Add theses lines to your application's Gemfile:

    gem 'cmsino'
    gem 'cancan'

And then execute:

    $ bundle
    $ rails g cancan:ability
    $ bunlde exec rake cmsino_engine:install:migrations
    $ bundel exec rake db:migrate

## Usage

Include `CmsinoHelper` in `app/controllers/application_controller.rb` and
for `CanCan` provide a `current_user` method in the controller.

For example in `app/controllers/application_controller.rb`

```ruby
class ApplicationController < ActionController::Base
  include CmsinoHelper

  def current_user
    User.new(:cmsino_user => session[:cmsino_user])
  end 
end
```

If you want to provide editable content to `home#index`
update the file `config/cmsino.yml` with 

```yaml
page:
  home: Home Page
```

, then add the tag `editable_page` to 
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
form (a http://nicedit.com/ styled form for now).

See https://github.com/donapieppo/cmsino/wiki/Usage for details.

## Why

For those searching for a tiny cms which allows your users to change 
only the contents (snippets) leaving you, the rails developer and web designer, 
with your editor (vim?), your rails gems and no web interface.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
