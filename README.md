# Cmsino

Cms rails gem for developers in its smallest form possible. Not usable now :-)

## Installation

Add this line to your application's Gemfile:

    gem 'cmsino'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cmsino

## Usage

Add 'cancan' gem in Gemfile and 

    $ rails g cancan:ability

Example for a Home controller

```ruby
class HomeController < ApplicationController
  def index
    editable_page(:home)
  end
end
```

and the respective view app/views/home/index.html.erb

```rails
<h2>Main content</h2>
<%= editable_content(:main) %>
```

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
