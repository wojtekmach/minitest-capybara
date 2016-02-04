module Minitest
  module Capybara
    class Test < Minitest::Test
      include ::Capybara::DSL
      include ::Capybara::Assertions

      def teardown
        ::Capybara.reset_session!
        ::Capybara.use_default_driver
      end
    end
  end
end
