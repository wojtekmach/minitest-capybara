require File.join(File.dirname(__FILE__), '..', 'test_helper')

describe Capybara do
  describe '.string' do
    include Capybara::DSL
    include Capybara::Assertions

    before do
      @test_node= Capybara.string <<-STRING
        Hi everybody

        I am a simple e-mail and just want to be tested

        Greetings

        Your friendly tester
      STRING
    end

    describe "assertions" do
      it "can assert_content String" do
        assert_content @test_node, "everybody"
      end

      it "can assert_content Regexp" do
        assert_content @test_node, /simple e-mail/
        assert_content @test_node, /just.*tested/
      end

      it "wont match Regexp in a String" do
        proc { assert_content(@test_node, "just.*tested") }.must_raise Minitest::Assertion
      end

      it "can refute_content" do
        refute_content @test_node, "Everybody"
      end
    end

    describe "expectations" do
      it "supports must_have_content" do
        @test_node.must_have_content "everybody"
      end

      it "supports must_have_content with regexp" do
        @test_node.must_have_content /simple e-mail/
        @test_node.must_have_content /just.*tested/
      end

      it "wont have Regexp content in a String" do
        proc { @test_node.must_have_content "just.*tested" }.must_raise Minitest::Assertion
      end

      it "supports wont_have_content" do
        @test_node.wont_have_content "Everybody"
      end
    end
  end
end
