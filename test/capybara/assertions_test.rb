require 'test_helper'

Capybara.app = lambda { |env| [200, {}, "<div><h1>foo</h1><a href='/'>bar</a></div>"] }

describe "Assertions" do
  include Capybara::DSL
  include Capybara::Assertions

  before do
    visit "/"
  end

  it "defines all the assertions that Capybara does" do
    assert_(:assertions)
  end

  it "defines all the refutations that Capybara does" do
   refute_(:refutations)
  end

  it "defines all the negative assertions that Capybara does" do
   assert_no_(:refutations)
  end
end
