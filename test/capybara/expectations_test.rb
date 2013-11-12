require 'test_helper'

Capybara.app = lambda { |env| [200, {}, "<div><h1>foo</h1><a href='/'>bar</a></div>"] }

describe "Expectations" do
  include Capybara::DSL
  include Capybara::Assertions

  before do
    visit "/"
  end

  it "defines all the must expectations that Capybara does" do
    must_have_(:assertions)
  end

  it "defines all the wont expectations that Capybara does" do
    wont_have_(:refutations)
  end
end
