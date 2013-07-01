require 'test_helper'

Capybara.app = lambda { |env| [200, {}, "<div><h1>foo</h1><a href='/'>bar</a></div>"] }

describe "Expectations" do
  include Capybara::DSL
  include Capybara::Assertions

  before do
    visit "/"
  end

  it "defines all the must expectations that Capybara does" do
    Minitest::Capybara.assertions.each do |assertion|
      assert page.respond_to?("must_have_#{assertion}"),
             "The expectation must_have_#{assertion} is not defined."
    end
  end

  it "defines all the wont expectations that Capybara does" do
    Minitest::Capybara.refutations.each do |refutation|
      assert page.respond_to?("wont_have_#{refutation}"),
             "The expectation wont_have_#{refutation} is not defined."
    end
  end
end
