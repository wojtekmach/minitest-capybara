require 'test_helper'

Capybara.app = lambda { |env| [200, {}, "<div><h1>foo</h1><a href='/'>bar</a></div>"] }

describe "app" do
  include Capybara::DSL
  include Capybara::Assertions

  before do
    visit "/"
  end

  # assertions

  it "supports assert_content" do
    assert_content("foo").must_equal true
    proc { assert_content("BAD") }.must_raise Minitest::Assertion
  end

  it "supports refute_content" do
    refute_content("BAD").must_equal true
    proc { refute_content("foo") }.must_raise Minitest::Assertion
  end

  it "supports assert_selector" do
    assert_selector "h1", text: "foo"
    assert_selector :css, "h1", text: "foo"
    proc { assert_selector "h1", text: "BAD" }.must_raise Minitest::Assertion
    proc { assert_selector :css, "h1", text: "BAD" }.must_raise Minitest::Assertion
  end

  it "supports refute_selector" do
    refute_selector "h1", text: "BAD"
    proc { refute_selector "h1", text: "foo" }.must_raise Minitest::Assertion
  end

  it "supports assert_link" do
    assert_link 'bar'
    proc { assert_link("BAD") }.must_raise Minitest::Assertion
  end

  it "supports refute_link" do
    refute_link 'BAD'
    proc { refute_link("bar") }.must_raise Minitest::Assertion
  end

  # expectations

  it "supports must_have_content" do
    page.must_have_content "foo"
    proc { page.must_have_content "BAD" }.must_raise Minitest::Assertion
  end

  it "supports wont_have_content" do
    page.wont_have_content "BAD"
    proc { page.wont_have_content "foo" }.must_raise Minitest::Assertion
  end

  it "supports must_have_selector" do
    page.must_have_selector "h1", text: "foo"
    page.must_have_selector :css, "h1", text: "foo"
    proc { page.must_have_selector "h1", text: "BAD" }.must_raise Minitest::Assertion
    proc { page.must_have_selector :css, "h1", text: "BAD" }.must_raise Minitest::Assertion
  end

  it "supports wont_have_selector" do
    page.wont_have_selector "h1", text: "BAD"
    proc { page.wont_have_selector "h1", text: "foo" }.must_raise Minitest::Assertion
  end

  it "supports must_have_link" do
    page.must_have_link 'bar'
    proc { page.must_have_link("BAD") }.must_raise Minitest::Assertion
  end

  it "supports wont_have_link" do
    page.wont_have_link 'BAD'
    proc { page.wont_have_link("bar") }.must_raise Minitest::Assertion
  end
end
