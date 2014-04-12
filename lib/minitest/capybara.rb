require "minitest/capybara/version"
require "capybara"

module Minitest
  module Capybara
    @@assertions = ::Capybara::Session::NODE_METHODS.grep(/^has_/).map { |s| s.to_s.match(/^has_(.*?)\?/)[1] }
    @@refutations = @@assertions.grep(/^no_/)
    @@assertions = (@@assertions - @@refutations).sort
    @@refutations = @@refutations.map { |s| s.match(/^no_(.*)/)[1] }.sort

    def self.assertions
      @@assertions
    end

    def self.refutations
      @@refutations
    end
  end
end

# Need to be required after Minitest::Capybara is defined
require "capybara/assertions"
require "capybara/expectations"

# :stopdoc:
module Minitest
  module Capybara
    def self.const_missing const
      if :Assertions == const
        warn "Minitest::Capybara::Assertions is deprecated. Please use Capybara::Assertions instead."
        ::Capybara::Assertions
      else
        super const
      end
    end
  end
end
