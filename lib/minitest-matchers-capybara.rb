require "minitest/matchers"
require "capybara/dsl"
require "capybara/rspec/matchers"

module Minitest
  module Matchers
    module Capybara
      VERSION = "0.0.1"
    end
  end
end

Capybara::RSpecMatchers.module_eval do
  def self.included(base)
    instance_methods.each do |name|
      base.register_matcher name, name
    end
  end
end
