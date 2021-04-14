# frozen_string_literal: true

require File.expand_path('lib/rails_material_design_icons/version', __dir__)

Gem::Specification.new do |gem|
  gem.authors       = ['sampokuokkanen']
  gem.email         = ['sampo.kuokkanen@gmail.com']
  gem.description   = 'Rails Material Design Icons provides the web fonts and stylesheets as a Rails engine for use with the asset pipeline.'
  gem.summary       = 'an asset gemification of the Material Icons font library'
  gem.homepage      = 'https://github.com/sampokuokkanen/rails_material_design_icons'
  gem.licenses      = ['MIT', 'Apache 2.0']

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec}/*`.split("\n")
  gem.name          = 'rails_material_design_icons'

  gem.require_paths = ['lib']
  gem.version       = MaterialDesignIcons::Rails::VERSION

  gem.add_dependency 'railties', '>= 3.2', '< 7'

  gem.add_development_dependency 'activesupport'
  gem.add_development_dependency 'byebug'
  gem.add_development_dependency 'sassc-rails'

  gem.required_ruby_version = '>= 1.9.3'
end
