module Capybara
  module Assertions
    def self.included(base)
      raise "Make sure to include Capybara::Assertions after Capybara::DSL" unless base < Capybara::DSL
    end

    def assert_text(*args)
      node, *args = prepare_args(args)
      assert node.has_text?(*args), message { "Expected to include #{args.first.inspect}" }
    end
    alias_method :assert_content, :assert_text

    def refute_text(*args)
      node, *args = prepare_args(args)
      assert node.has_no_text?(*args), message { "Expected not to include #{args.first.inspect}" }
    end
    alias_method :assert_no_text, :refute_text
    alias_method :refute_content, :refute_text
    alias_method :assert_no_content, :refute_text

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
    alias_method :assert_no_selector, :refute_selector

    ruby = ""
    (Minitest::Capybara.assertions - %w[text content selector]).each do |assertion|
      ruby << <<-RUBY
        def assert_#{assertion}(*args)
          node, *args = prepare_args(args)
          assert node.has_#{assertion}?(*args), message { Capybara::Helpers.failure_message(*args) }
        end
      RUBY
    end
    (Minitest::Capybara.refutations - %w[text content selector]).each do |refutation|
      ruby << <<-RUBY
        def refute_#{refutation}(*args)
          node, *args = prepare_args(args)
          assert node.has_no_#{refutation}?(*args), message { Capybara::Helpers.failure_message(*args) }
        end
        alias_method :assert_no_#{refutation}, :refute_#{refutation}
      RUBY
    end
    class_eval(ruby)

    ##
    # Assertion that there is button
    #
    # see Capybara::Assertions#refute_button
    # see Capybara::Assertions#assert_no_button
    # see Capybara::expectations#must_have_button
    # see Capybara::expectations#wont_have_button
    # :method: assert_button

    ##
    # Assertion that there is no button
    #
    # see Capybara::Assertions#assert_button
    # see Capybara::expectations#must_have_button
    # see Capybara::expectations#wont_have_button
    # :method: refute_button
    # :alias: assert_no_button


    ##
    # Assertion that there is checked_field
    #
    # see Capybara::Assertions#refute_checked_field
    # see Capybara::Assertions#assert_no_checked_field
    # see Capybara::expectations#must_have_checked_field
    # see Capybara::expectations#wont_have_checked_field
    # :method: assert_checked_field

    ##
    # Assertion that there is no checked_field
    #
    # see Capybara::Assertions#assert_checked_field
    # see Capybara::expectations#must_have_checked_field
    # see Capybara::expectations#wont_have_checked_field
    # :method: refute_checked_field
    # :alias: assert_no_checked_field


    ##
    # Assertion that there is content
    #
    # see Capybara::Assertions#refute_content
    # see Capybara::Assertions#assert_no_content
    # see Capybara::expectations#must_have_content
    # see Capybara::expectations#wont_have_content
    # :method: assert_content

    ##
    # Assertion that there is no content
    #
    # see Capybara::Assertions#assert_content
    # see Capybara::expectations#must_have_content
    # see Capybara::expectations#wont_have_content
    # :method: refute_content
    # :alias: assert_no_content


    ##
    # Assertion that there is css
    #
    # see Capybara::Assertions#refute_css
    # see Capybara::Assertions#assert_no_css
    # see Capybara::expectations#must_have_css
    # see Capybara::expectations#wont_have_css
    # :method: assert_css

    ##
    # Assertion that there is no css
    #
    # see Capybara::Assertions#assert_css
    # see Capybara::expectations#must_have_css
    # see Capybara::expectations#wont_have_css
    # :method: refute_css
    # :alias: assert_no_css


    ##
    # Assertion that there is field
    #
    # see Capybara::Assertions#refute_field
    # see Capybara::Assertions#assert_no_field
    # see Capybara::expectations#must_have_field
    # see Capybara::expectations#wont_have_field
    # :method: assert_field

    ##
    # Assertion that there is no field
    #
    # see Capybara::Assertions#assert_field
    # see Capybara::expectations#must_have_field
    # see Capybara::expectations#wont_have_field
    # :method: refute_field
    # :alias: assert_no_field


    ##
    # Assertion that there is link
    #
    # see Capybara::Assertions#refute_link
    # see Capybara::Assertions#assert_no_link
    # see Capybara::expectations#must_have_link
    # see Capybara::expectations#wont_have_link
    # :method: assert_link

    ##
    # Assertion that there is no link
    #
    # see Capybara::Assertions#assert_link
    # see Capybara::expectations#must_have_link
    # see Capybara::expectations#wont_have_link
    # :method: refute_link
    # :alias: assert_no_link


    ##
    # Assertion that there is select
    #
    # see Capybara::Assertions#refute_select
    # see Capybara::Assertions#assert_no_select
    # see Capybara::expectations#must_have_select
    # see Capybara::expectations#wont_have_select
    # :method: assert_select

    ##
    # Assertion that there is no select
    #
    # see Capybara::Assertions#assert_select
    # see Capybara::expectations#must_have_select
    # see Capybara::expectations#wont_have_select
    # :method: refute_select
    # :alias: assert_no_select


    ##
    # Assertion that there is selector
    #
    # see Capybara::Assertions#refute_selector
    # see Capybara::Assertions#assert_no_selector
    # see Capybara::expectations#must_have_selector
    # see Capybara::expectations#wont_have_selector
    # :method: assert_selector

    ##
    # Assertion that there is no selector
    #
    # see Capybara::Assertions#assert_selector
    # see Capybara::expectations#must_have_selector
    # see Capybara::expectations#wont_have_selector
    # :method: refute_selector
    # :alias: assert_no_selector


    ##
    # Assertion that there is table
    #
    # see Capybara::Assertions#refute_table
    # see Capybara::Assertions#assert_no_table
    # see Capybara::expectations#must_have_table
    # see Capybara::expectations#wont_have_table
    # :method: assert_table

    ##
    # Assertion that there is no table
    #
    # see Capybara::Assertions#assert_table
    # see Capybara::expectations#must_have_table
    # see Capybara::expectations#wont_have_table
    # :method: refute_table
    # :alias: assert_no_table


    ##
    # Assertion that there is text
    #
    # see Capybara::Assertions#refute_text
    # see Capybara::Assertions#assert_no_text
    # see Capybara::expectations#must_have_text
    # see Capybara::expectations#wont_have_text
    # :method: assert_text

    ##
    # Assertion that there is no text
    #
    # see Capybara::Assertions#assert_text
    # see Capybara::expectations#must_have_text
    # see Capybara::expectations#wont_have_text
    # :method: refute_text
    # :alias: assert_no_text


    ##
    # Assertion that there is unchecked_field
    #
    # see Capybara::Assertions#refute_unchecked_field
    # see Capybara::Assertions#assert_no_unchecked_field
    # see Capybara::expectations#must_have_unchecked_field
    # see Capybara::expectations#wont_have_unchecked_field
    # :method: assert_unchecked_field

    ##
    # Assertion that there is no unchecked_field
    #
    # see Capybara::Assertions#assert_unchecked_field
    # see Capybara::expectations#must_have_unchecked_field
    # see Capybara::expectations#wont_have_unchecked_field
    # :method: refute_unchecked_field
    # :alias: assert_no_unchecked_field


    ##
    # Assertion that there is xpath
    #
    # see Capybara::Assertions#refute_xpath
    # see Capybara::Assertions#assert_no_xpath
    # see Capybara::expectations#must_have_xpath
    # see Capybara::expectations#wont_have_xpath
    # :method: assert_xpath

    ##
    # Assertion that there is no xpath
    #
    # see Capybara::Assertions#assert_xpath
    # see Capybara::expectations#must_have_xpath
    # see Capybara::expectations#wont_have_xpath
    # :method: refute_xpath
    # :alias: assert_no_xpath

    private

    def prepare_args(args)
      if args.first.is_a?(Capybara::Session) || args.first.kind_of?(Capybara::Node::Base) ||
          args.first.is_a?(Capybara::Node::Simple)
        args
      else
        [page, *args]
      end
    end
  end
end
