require "capybara"
require "capybara/dsl"
require "minitest/capybara/version"

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

module Minitest
  module Capybara
    module Behaviour
      include ::Capybara::DSL
      include ::Capybara::Assertions

      def teardown
        ::Capybara.reset_session!
        ::Capybara.use_default_driver
      end
    end

    class Test < Minitest::Test
      include Behaviour
    end

    class Spec < Minitest::Spec
      include Behaviour
    end
  end
end
