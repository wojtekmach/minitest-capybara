module Minitest
  module Capybara
    class Spec < Minitest::Spec
      include ::Capybara::DSL
      include ::Capybara::Assertions

      def teardown
        ::Capybara.reset_session!
        ::Capybara.use_default_driver
      end
    end
  end
end
