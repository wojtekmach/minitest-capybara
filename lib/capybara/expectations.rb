require "minitest/spec"

module Capybara
  module Expectations
    Minitest::Capybara.assertions.each do |assertion|
      infect_an_assertion "assert_#{assertion}", "must_have_#{assertion}", :reverse
    end

    Minitest::Capybara.refutations.each do |refutation|
      infect_an_assertion "refute_#{refutation}", "wont_have_#{refutation}", :reverse
    end

    ##
    # Expectation that there is button
    #
    # see Capybara::Expectations#wont_have_button
    # see Capybara::Assertions#assert_button
    # see Capybara::Assertions#refute_button
    # see Capybara::Assertions#assert_no_button
    # :method: must_have_button

    ##
    # Expectation that there is no button
    #
    # see Capybara::Expectations#must_have_button
    # see Capybara::Assertions#assert_button
    # see Capybara::Assertions#refute_button
    # see Capybara::Assertions#assert_no_button
    # :method: wont_have_button


    ##
    # Expectation that there is checked_field
    #
    # see Capybara::Expectations#wont_have_checked_field
    # see Capybara::Assertions#assert_checked_field
    # see Capybara::Assertions#refute_checked_field
    # see Capybara::Assertions#assert_no_checked_field
    # :method: must_have_checked_field

    ##
    # Expectation that there is no checked_field
    #
    # see Capybara::Expectations#must_have_checked_field
    # see Capybara::Assertions#assert_checked_field
    # see Capybara::Assertions#refute_checked_field
    # see Capybara::Assertions#assert_no_checked_field
    # :method: wont_have_checked_field


    ##
    # Expectation that there is content
    #
    # see Capybara::Expectations#wont_have_content
    # see Capybara::Assertions#assert_content
    # see Capybara::Assertions#refute_content
    # see Capybara::Assertions#assert_no_content
    # :method: must_have_content

    ##
    # Expectation that there is no content
    #
    # see Capybara::Expectations#must_have_content
    # see Capybara::Assertions#assert_content
    # see Capybara::Assertions#refute_content
    # see Capybara::Assertions#assert_no_content
    # :method: wont_have_content


    ##
    # Expectation that there is css
    #
    # see Capybara::Expectations#wont_have_css
    # see Capybara::Assertions#assert_css
    # see Capybara::Assertions#refute_css
    # see Capybara::Assertions#assert_no_css
    # :method: must_have_css

    ##
    # Expectation that there is no css
    #
    # see Capybara::Expectations#must_have_css
    # see Capybara::Assertions#assert_css
    # see Capybara::Assertions#refute_css
    # see Capybara::Assertions#assert_no_css
    # :method: wont_have_css


    ##
    # Expectation that there is field
    #
    # see Capybara::Expectations#wont_have_field
    # see Capybara::Assertions#assert_field
    # see Capybara::Assertions#refute_field
    # see Capybara::Assertions#assert_no_field
    # :method: must_have_field

    ##
    # Expectation that there is no field
    #
    # see Capybara::Expectations#must_have_field
    # see Capybara::Assertions#assert_field
    # see Capybara::Assertions#refute_field
    # see Capybara::Assertions#assert_no_field
    # :method: wont_have_field


    ##
    # Expectation that there is link
    #
    # see Capybara::Expectations#wont_have_link
    # see Capybara::Assertions#assert_link
    # see Capybara::Assertions#refute_link
    # see Capybara::Assertions#assert_no_link
    # :method: must_have_link

    ##
    # Expectation that there is no link
    #
    # see Capybara::Expectations#must_have_link
    # see Capybara::Assertions#assert_link
    # see Capybara::Assertions#refute_link
    # see Capybara::Assertions#assert_no_link
    # :method: wont_have_link


    ##
    # Expectation that there is select
    #
    # see Capybara::Expectations#wont_have_select
    # see Capybara::Assertions#assert_select
    # see Capybara::Assertions#refute_select
    # see Capybara::Assertions#assert_no_select
    # :method: must_have_select

    ##
    # Expectation that there is no select
    #
    # see Capybara::Expectations#must_have_select
    # see Capybara::Assertions#assert_select
    # see Capybara::Assertions#refute_select
    # see Capybara::Assertions#assert_no_select
    # :method: wont_have_select


    ##
    # Expectation that there is selector
    #
    # see Capybara::Expectations#wont_have_selector
    # see Capybara::Assertions#assert_selector
    # see Capybara::Assertions#refute_selector
    # see Capybara::Assertions#assert_no_selector
    # :method: must_have_selector

    ##
    # Expectation that there is no selector
    #
    # see Capybara::Expectations#must_have_selector
    # see Capybara::Assertions#assert_selector
    # see Capybara::Assertions#refute_selector
    # see Capybara::Assertions#assert_no_selector
    # :method: wont_have_selector


    ##
    # Expectation that there is table
    #
    # see Capybara::Expectations#wont_have_table
    # see Capybara::Assertions#assert_table
    # see Capybara::Assertions#refute_table
    # see Capybara::Assertions#assert_no_table
    # :method: must_have_table

    ##
    # Expectation that there is no table
    #
    # see Capybara::Expectations#must_have_table
    # see Capybara::Assertions#assert_table
    # see Capybara::Assertions#refute_table
    # see Capybara::Assertions#assert_no_table
    # :method: wont_have_table


    ##
    # Expectation that there is text
    #
    # see Capybara::Expectations#wont_have_text
    # see Capybara::Assertions#assert_text
    # see Capybara::Assertions#refute_text
    # see Capybara::Assertions#assert_no_text
    # :method: must_have_text

    ##
    # Expectation that there is no text
    #
    # see Capybara::Expectations#must_have_text
    # see Capybara::Assertions#assert_text
    # see Capybara::Assertions#refute_text
    # see Capybara::Assertions#assert_no_text
    # :method: wont_have_text


    ##
    # Expectation that there is unchecked_field
    #
    # see Capybara::Expectations#wont_have_unchecked_field
    # see Capybara::Assertions#assert_unchecked_field
    # see Capybara::Assertions#refute_unchecked_field
    # see Capybara::Assertions#assert_no_unchecked_field
    # :method: must_have_unchecked_field

    ##
    # Expectation that there is no unchecked_field
    #
    # see Capybara::Expectations#must_have_unchecked_field
    # see Capybara::Assertions#assert_unchecked_field
    # see Capybara::Assertions#refute_unchecked_field
    # see Capybara::Assertions#assert_no_unchecked_field
    # :method: wont_have_unchecked_field


    ##
    # Expectation that there is xpath
    #
    # see Capybara::Expectations#wont_have_xpath
    # see Capybara::Assertions#assert_xpath
    # see Capybara::Assertions#refute_xpath
    # see Capybara::Assertions#assert_no_xpath
    # :method: must_have_xpath

    ##
    # Expectation that there is no xpath
    #
    # see Capybara::Expectations#must_have_xpath
    # see Capybara::Assertions#assert_xpath
    # see Capybara::Assertions#refute_xpath
    # see Capybara::Assertions#assert_no_xpath
    # :method: wont_have_xpath
  end
end

class Capybara::Session
  include Capybara::Expectations unless ENV["MT_NO_EXPECTATIONS"]
end

class Capybara::Node::Base
  include Capybara::Expectations unless ENV["MT_NO_EXPECTATIONS"]
end

class Capybara::Node::Simple
  include Capybara::Expectations unless ENV["MT_NO_EXPECTATIONS"]
end
