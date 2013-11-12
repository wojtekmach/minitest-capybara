require 'test_helper'

feature "Testing Features" do

  scenario "I am a scenario" do
    :it_works.must_equal :it_works
  end

  scenario "it must include AcceptanceSpec" do
    self.class.must_include Minitest::AcceptanceSpec
  end

  feature "must work if nested" do
    scenario "it works" do
      :it_works.must_equal :it_works
    end
  end

end

feature "Testing methods" do

  given(:bob) { self.class }

  scenario { bob.must_respond_to :background }

end
