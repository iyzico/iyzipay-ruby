lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iyzipay/version'

Gem::Specification.new do |s|
  s.name                  = 'iyzipay'
  s.version               = Iyzipay::VERSION
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.3'
  s.summary               = %q{iyzipay api ruby client}
  s.description           = %q{iyzipay api ruby client. You can sign up for an iyzico account at https://iyzico.com}
  s.authors               = ['Iyzico']
  s.email                 = 'iyzico-ci@iyzico.com'
  s.files                 = `git ls-files`.split("\n")
  s.test_files            = `git ls-files -- {spec}/*`.split("\n")
  s.homepage              = 'http://rubygems.org/gems/iyzipay'
  s.license               = 'MIT'

  s.add_runtime_dependency 'rest-client', '~> 1.8', '>= 1.8.0'
  s.add_development_dependency 'rspec', '~> 3.3', '>= 3.3.0'
  s.add_development_dependency 'rspec-rails', '~> 3.3', '>= 3.3.0'

  s.require_paths = ['lib']
end