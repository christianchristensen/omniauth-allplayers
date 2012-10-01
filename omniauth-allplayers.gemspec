# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-allplayers/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-allplayers"
  s.version     = OmniAuth::AllPlayers::VERSION
  s.authors     = ["Chris Christensen"]
  s.email       = ["chris@allplayers.com"]
  s.homepage    = "https://github.com/allplayers/omniauth-allplayers"
  s.summary     = %q{OmniAuth strategy for AllPlayers.com}
  s.description = %q{OmniAuth strategy for AllPlayers.com}

  s.rubyforge_project = "omniauth-allplayers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'multi_json', '~> 1.3'
  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
end
