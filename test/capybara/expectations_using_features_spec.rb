require 'test_helper'

Capybara.app = lambda { |env| [200, {}, "<div><h1>foo</h1><a href='/'>bar</a></div>"] }

feature "Expectations" do

  given(:bob) { "Hi 'am bob" }
  background do
    visit "/"
  end

  scenario "defines all the must expectations that Capybara does" do
    must_have_(:assertions)
  end

  scenario "defines all the wont expectations that Capybara does" do
    wont_have_(:refutations)
  end

  scenario "bob" do
    bob.must_be_kind_of String
  end

end
