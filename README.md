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

`minitest-capybara` (and `capybara`) works with Rails out of the box, remember to require `capybara/rails`.

See example Rails app: <https://github.com/wojtekmach/minitest-capybara-example>.

For more features check out: [minitest-rails-capybara](https://github.com/blowmage/minitest-rails-capybara).

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
