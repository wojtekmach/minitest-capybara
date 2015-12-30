require "test_helper"

describe "Assertions" do
  include Capybara::DSL
  include Capybara::Assertions

  it "defines all the assertions that Capybara does" do
    Minitest::Capybara.assertions.each do |assertion|
      assert self.respond_to?("assert_#{assertion}"),
             "The assertion assert_#{assertion} is not defined."
    end
  end

  it "defines all the refutations that Capybara does" do
    Minitest::Capybara.refutations.each do |refutation|
      assert self.respond_to?("refute_#{refutation}"),
             "The assertion refute_#{refutation} is not defined."
    end
  end

  it "defines all the negative assertions that Capybara does" do
    Minitest::Capybara.refutations.each do |refutation|
      assert self.respond_to?("assert_no_#{refutation}"),
             "The assertion assert_no_#{refutation} is not defined."
    end
  end
end
