# minitest-capybara

[![Build Status](https://secure.travis-ci.org/wojtekmach/minitest-capybara.png?branch=master)](http://travis-ci.org/wojtekmach/minitest-capybara)

Capybara matchers support for minitest unit & spec

## Why?

Capybara has good support for RSpec.

If you want to use it with minitest, you can of course write:

```ruby
assert page.has_content?("Hello")
```

but:

1. it's kinda ugly
2. you don't have meaningfull error messages.

With this project minitest gets all the good stuff.

## Rails integration

Check out [minitest-rails-capybara](https://github.com/blowmage/minitest-rails-capybara)

## Usage

See example app: https://github.com/wojtekmach/minitest-capybara-example

Add to Gemfile:

```ruby
# Gemfile
group :test do
  gem "minitest-capybara"
end
```

```ruby
# features/my_feature.rb
require 'test_helper'

feature "My Super Feature" do
  given(:lion) { ... }

  background do
    visit "/feature"
  end

  scenario "this awesome feature" do
    page.must_have_content("Awesome Feature")
  end
end
```

Or if you prefer to create seperate test class for acceptance tests.

```ruby
# test/test_helper.rb
require "capybara/rails"

# for just minitest/unit
class AcceptanceTest < Minitest::Test
  include Capybara::DSL
  include Capybara::Assertions

  def teardown
    Capybara.reset_session!
    Capybara.use_default_driver
  end
end

# for minitest/spec
class AcceptanceSpec < Minitest::Spec
  include Capybara::DSL
  include Capybara::Assertions

  def teardown
    Capybara.reset_session!
    Capybara.use_default_driver
  end
end
```

and you can use it like this:

```ruby
# test/acceptance/home_test.rb
require "test_helper"

class HomeTest < AcceptanceSpec
  it "home test" do
    visit "/"

    assert_content "Homepage"
    page.must_have_content "Homepage"

    within ".login" do
      refute_content "Signed in as"
      page.wont_have_content "Signed in as"
    end

    assert_link "Sign in"
    assert_link find(".login"), "Sign in"
    find(".login").must_have_link("Sign in")

    assert_selector 'li:first', text: "Item 1"
    page.must_have_selector 'li:first', text: "Item 1"
  end
end
```

## Capybara drivers

Switching drivers is easy with [minitest-metadata]:

  [minitest-metadata]: https://github.com/wojtekmach/minitest-metadata

```ruby
require 'minitest-metadata'

class AcceptanceSpec
  before do
    if metadata[:js]
      Capybara.current_driver = Capybara.javascript_driver
    else
      Capybara.current_driver = Capybara.default_driver
    end
  end
end

class HomeTest < AcceptanceSpec
  it "home with ajax", js: true do
    visit "/"
    page.must_have_content "AJAX enabled..."
  end
end
```

## License

(The MIT License)

Copyright (c) Wojciech Mach

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
