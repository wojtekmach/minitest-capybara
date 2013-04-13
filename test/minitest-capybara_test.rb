require "minitest-capybara"
require "minitest/autorun"

describe "test" do
  include Capybara::RSpecMatchers

  it "supports have_selector" do
    subject = "<h1>hello <a>asd</a></h1>"
    args = [:css, "h1 a", {:text => "asd"}]

    assert_have_selector subject, *args
    subject.must_have_selector *args
  end
end

Capybara.app = lambda { |env| [200, {}, "<p><h1>foo</h1></p>"] }

describe "app" do
  include Capybara::RSpecMatchers
  include Capybara::DSL

  it "works" do
    visit "/"
    assert_have_content(page, "foo").must_equal true
    proc { refute_have_content page, "foo" }.must_raise MiniTest::Assertion
  end
end
