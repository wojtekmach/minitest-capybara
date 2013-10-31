require 'test_helper'

app = lambda { |env|
  [200, { "X-Content-Type" => "Capybara" },"<div><h1>foo</h1><a href='/'>bar</a></div>"]
}

Capybara.app = app

feature "Assertions" do

  background do
    visit "/"
  end

  scenario "defines all assertions capybara does" do
    assert_(:assertions)
  end

  scenario "defines all refutations that Capybara does" do
    refute_(:refutations)
  end

  scenario "defines all negative assertions that Capybara does" do
    assert_no_(:refutations)
  end

end
