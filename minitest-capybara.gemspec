# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "minitest/capybara/version"

Gem::Specification.new do |s|
  s.name        = "minitest-capybara"
  s.version     = MiniTest::Capybara::VERSION
  s.authors     = ["Wojciech Mach"]
  s.email       = ["wojtek@wojtekmach.pl"]
  s.homepage    = ""
  s.summary     = %q{Capybara matchers support for minitest unit and spec}
  s.description = s.summary

  s.rubyforge_project = "minitest-capybara"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "capybara", "~> 2.2"

  s.add_runtime_dependency "rake"
  s.add_runtime_dependency "minitest", "~> 5.0"
end
