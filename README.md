# Cmsino

Cms rails gem (Rails Engine) for developers in its smallest form possible. Not usable now :-)

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

Example for a Home controller

```ruby
class HomeController < ApplicationController
  def index
    editable_page(:home)
  end
end
```

and the respective view app/views/home/index.html.erb

```erb
<h2>Main content</h2>
<%= editable_content(:main) %>
```

When you visit /home for the first time the *content* named
:main for the page :home
is created in the database as an empty string.
When authenticated (see cancan) you get an editable 
form (a http://nicedit.com/ styled form for now).

see https://github.com/donapieppo/cmsino/wiki/Usage for details.

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
