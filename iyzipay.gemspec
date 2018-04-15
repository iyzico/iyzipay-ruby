lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name                  = 'iyzipay'
  s.version               = '1.0.44'
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

  s.add_runtime_dependency 'rest-client', '~> 2.0'
  s.add_runtime_dependency 'rack', '~> 1.6.4'
  s.add_development_dependency 'rspec', '~>3.5.0'
  s.add_development_dependency 'rspec-rails', '~>3.5.0'
  s.add_development_dependency 'nokogiri', '~>1.8.2'
  s.require_paths = ['lib']
end