# material_design_icons_rails

[![Gem Version](http://img.shields.io/gem/v/material_design_icons_rails.svg)](https://rubygems.org/gems/material_design_icons_rails)
[![Build Status](https://github.com/sampokuokkanen/material_design_icons_rails/workflows/CI/badge.svg)](https://github.com/sampokuokkanen/material_design_icons_rails/actions?query=workflow%3ACI)
[![Gem Downloads](https://img.shields.io/gem/dt/material_design_icons_rails.svg)](https://rubygems.org/gems/material_design_icons_rails)

material_design_icons_rails provides the
[Material Design Icons](https://materialdesignicons.com/) web fonts and
stylesheets as a Rails engine for use with the asset pipeline.

Most of the work was done in Font Awesome gem, this just changes the files to Material Design Icons. 
[Font Awesome Rails](https://github.com/bokmann/font-awesome-rails)

## Installation

Add this to your Gemfile:

```ruby
gem "material_design_icons_rails"
```

and run `bundle install`.

## Usage

In your `application.css`, include the css file:

```css
/*
 *= require font-awesome
 */
```
Then restart your webserver if it was previously running.

Congrats! You now have scalable vector icon support. Pick an icon and check out the official website for the icons available. 
[https://materialdesignicons.com/](https://materialdesignicons.com/).

### Sass Support

If you prefer [SCSS](http://sass-lang.com/documentation/file.SASS_REFERENCE.html), add this to your
`application.css.scss` file:

```scss
@import "materialdesignicons";
```

If you use the
[Sass indented syntax](http://sass-lang.com/docs/yardoc/file.INDENTED_SYNTAX.html),
add this to your `application.css.sass` file:

```sass
@import materialdesignicons
```

### Helpers

There are also some helpers (`fa_icon` and `fa_stacked_icon`) that make your
views _icontastic!_

```ruby
md_icon "sheep"
# => <i class="mdi md-sheep"></i>

### Deploying to sub-folders

It is sometimes the case that deploying a Rails application to a production
environment requires the application to be hosted at a sub-folder on the server.
This may be the case, for example, if Apache HTTPD or Nginx is being used as a
front-end proxy server, with Rails handling only requests that come in to a sub-folder
such as `http://example.com/myrailsapp`. In this case, the
FontAwesome gem (and other asset-serving engines) needs to know the sub-folder,
otherwise you can experience a problem roughly described as ["my app works
fine in development, but fails when I deploy
it"](https://github.com/bokmann/font-awesome-rails/issues/74).

To fix this, set the *relative URL root* for the application. In the
environment file for the deployed version of the app, for example
`config/environments/production.rb`,
set the config option `action_controller.relative_url_root`:

    MyApp::Application.configure do
      ...

      # set the relative root, because we're deploying to /myrailsapp
      config.action_controller.relative_url_root  = "/myrailsapp"

      ...
    end

The default value of this variable is taken from `ENV['RAILS_RELATIVE_URL_ROOT']`,
so configuring the environment to define `RAILS_RELATIVE_URL_ROOT` is an alternative strategy.

In addition you need to indicate the subfolder when you *precompile* the assets:

    RAILS_ENV=production bundle exec rake assets:precompile RAILS_RELATIVE_URL_ROOT=/myrailsapp

## License

* The [Material Design](https://materialdesignicons.com/) font is
  licensed under the Apache 2.0 (https://www.apache.org/licenses/LICENSE-2.0)
* [Material Design](http://fortawesome.github.com/Font-Awesome) CSS files are
  licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
* The remainder of the material_design_icons_rails project is licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
