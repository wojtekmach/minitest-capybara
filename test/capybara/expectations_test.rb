require "test_helper"

describe "Expectations" do
  include Capybara::DSL
  include Capybara::Assertions

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
