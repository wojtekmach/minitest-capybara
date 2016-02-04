# minitest-capybara

[![Build Status](https://secure.travis-ci.org/wojtekmach/minitest-capybara.png?branch=master)](http://travis-ci.org/wojtekmach/minitest-capybara)

Capybara matchers support for Minitest unit & spec.

## Why?

Capybara has good support for RSpec.

If you want to use it with Minitest, you can of course write:

```ruby
assert page.has_content?("Hello")
```

but:

1. it's kinda ugly
2. you don't have meaningfull error messages.

With this project Minitest gets all the good stuff.

## Rails integration

`minitest-capybara` (and `capybara`) works with Rails out of the box, remember to require `capybara/rails`.

See example Rails app: <https://github.com/wojtekmach/minitest-capybara-example>.

For more features, check out: [minitest-rails-capybara](https://github.com/blowmage/minitest-rails-capybara).

## Usage

With minitest/test:

```ruby
class HomeTest < Minitest::Capybara::Test
  def test_home
    visit "/"

    assert_content "Homepage"

    within ".login" do
      refute_content "Signed in as"
    end

    assert_link "Sign in"
    assert_link find(".login"), "Sign in"

    assert_selector 'li:first', text: "Item 1"
  end
end
```

With minitest/spec:

```ruby
class HomeSpec < Minitest::Capybara::Spec
  it "works" do
    visit "/"

    page.must_have_content "Homepage"

    within ".login" do
      page.wont_have_content "Signed in as"
    end

    find(".login").must_have_link("Sign in")

    page.must_have_selector 'li:first', text: "Item 1"
  end
end
```

Instead of inheriting directly from Minitest::Capybara::Test (or Spec) it's usually better to create a custom test base class:

```ruby
# test/acceptance_test_helper.rb
require "minitest/autorun"

class AcceptanceTest < Minitest::Capybara::Test
  # custom methods, before blocks etc.
end
```

If you need to inherit from a different base class (e.g. `ActiveSupport::TestCase`) you can do this instead:

```ruby
# test/acceptance_test_helper.rb
require "test_helper"

class AcceptanceTest < ActiveSupport::TestCase
  include Minitest::Capybara::Behaviour

  # custom methods, before blocks etc.
end
```

## Capybara drivers

Switching drivers is easy with [minitest-metadata]:

  [minitest-metadata]: https://github.com/wojtekmach/minitest-metadata

```ruby
require 'minitest-metadata'

class AcceptanceSpec < Minitest::Capybara::Spec
  before do
    if metadata[:js]
      Capybara.current_driver = Capybara.javascript_driver
    else
      Capybara.current_driver = Capybara.default_driver
    end
  end
end

class HomeSpec < AcceptanceSpec
  it "home with ajax", js: true do
    visit "/"
    page.must_have_content "AJAX enabled..."
  end
end
```

## License

minitest-capybara is released under the [MIT License](LICENSE.txt).
