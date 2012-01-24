# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fraudpointer/client/version"

Gem::Specification.new do |s|
  s.name        = "fraudpointer-client"
  s.version     = Fraudpointer::Client::VERSION
  s.authors     = ["Nikos Dimitrakopoulos"]
  s.email       = ["n.dimitrakopoulos@fraudpointer.com"]
  s.homepage    = "http://www.fraudpointer.com"
  s.summary     = %q{Client library for accessing Fraudpointer REST API}
  s.description = %q{Client library for accessing Fraudpointer REST API}

  s.rubyforge_project = "fraudpointer-client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Development
  s.add_development_dependency 'rake'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'simplecov'

  if RbConfig::CONFIG['target_os'] =~ /darwin/i
    s.add_development_dependency 'rb-fsevent'
    s.add_development_dependency 'growl'
  elsif RbConfig::CONFIG['target_os'] =~ /linux/i
    s.add_development_dependency 'rb-inotify'
    s.add_development_dependency 'libnotify'
  end

  # Documentation
  s.add_development_dependency 'yard'
  s.add_development_dependency 'redcarpet'
  s.add_development_dependency 'github-markup'

  # Runtime
  s.add_runtime_dependency 'activesupport'
  s.add_runtime_dependency 'activeresource'
end
