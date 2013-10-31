module Helper

  def capybara(m)
    Minitest::Capybara.send(m)
  end

  def notice(msg)
    "The #{msg} is not defined."
  end

  def or_message(method_name, msg)
    if method_name =! Regexp.new("have")
      notice("assertions " + msg)
    else
      notice("expectation "+ msg)
    end
  end

  def respond_to(m)
    self.respond_to?(m) || page.respond_to?(m)
  end

  def assert_(method_name)
    callee = send(:__callee__).id2name
    capybara(method_name).each do |assertion|
      _method_ = "#{callee}#{assertion}"

      assert respond_to(_method_),
        or_message(callee, _method_)
    end
  end

  alias :refute_    :assert_
  alias :assert_no_ :assert_
  alias :must_have_ :assert_
  alias :wont_have_ :assert_

end

Object.send(:include, Helper)
