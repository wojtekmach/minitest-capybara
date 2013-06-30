require 'minitest/capybara/version'
require 'minitest/spec'

module Minitest::Capybara
  module Assertions
    METHODS = Capybara::Session::NODE_METHODS.grep(/^has_/).map { |s| s.to_s.match(/has_(.*?)\?/)[1] }

    def self.included(base)
      raise "Make sure to include Capybara::Minitest::Assertions after Capybara::DSL" unless base < Capybara::DSL
    end

    def self.assertion_name(method)
      method.start_with?('no_') ? "refute_#{method.gsub(/^no_/, '')}" : "assert_#{method}"
    end

    def assert_text(*args)
      node, *args = prepare_args(args)
      assert has_text?(*args), message { "Expected to include #{args.first.inspect}" }
    end
    alias_method :assert_content, :assert_text

    def refute_text(*args)
      node, *args = prepare_args(args)
      assert has_no_text?(*args), message { "Expected not to include #{args.first.inspect}" }
    end
    alias_method :refute_content, :refute_text

    def assert_selector(*args)
      node, *args = prepare_args(args)
      node.assert_selector(*args)
    rescue Capybara::ExpectationNotMet => e
      assert false, e.message
    end

    def refute_selector(*args)
      node, *args = prepare_args(args)
      node.assert_no_selector(*args)
    rescue Capybara::ExpectationNotMet => e
      assert false, e.message
    end

    ruby = ""
    (METHODS - %w[text no_text content no_content selector no_selector]).each do |method|
      assertion_name = method.start_with?('no') ? "refute_#{method.gsub(/^no_/, '')}" : "assert_#{method}"

      ruby << <<-RUBY
        def #{assertion_name}(*args)
          node, *args = prepare_args(args)
          assert node.has_#{method}?(*args), message { Capybara::Helpers.failure_message(*args) }
        end
      RUBY
    end
    class_eval(ruby)

    private

    def prepare_args(args)
      if args.first.is_a?(Capybara::Session) || args.first.kind_of?(Capybara::Node::Base)
        args
      else
        [page, *args]
      end
    end
  end

  module Expectations
    def self.expectation_name(method)
      method.start_with?('no_') ? "wont_have_#{method.gsub(/^no_/, '')}" : "must_have_#{method}"
    end

    Assertions::METHODS.each do |method|
      infect_an_assertion Assertions.assertion_name(method), expectation_name(method), :reverse
    end
  end
end

class Capybara::Session
  include Minitest::Capybara::Expectations
end

class Capybara::Node::Base
  include Minitest::Capybara::Expectations
end
