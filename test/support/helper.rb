module Helper

  def capybara(m)
    Minitest::Capybara.send(m)
  end

  def notice(msg)
    "The #{msg} is not defined."
  end

  ##
  # method_name matches anything apart from have
  # it must be an assertion
  # if it matches it must be an expectation
  #
  def or_message(method_name, msg)
    if method_name =! Regexp.new("have")
      notice("assertions " + msg)
    else
      notice("expectation "+ msg)
    end
  end

  ##
  # Ask either self or page
  #
  def respond_to(m)
    self.respond_to?(m) || page.respond_to?(m)
  end

  ##
  # callee here works but __method__ would not.
  # that's because callee changes accordingly as
  # self changes.
  # id2name simply converts a symbol to a string.
  # _method_ creates a method to be looked up
  # _method_ = "refute_method_name"
  #
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
