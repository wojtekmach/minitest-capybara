module Minitest
  module Features
    module DSL

      include AcceptanceSpec

      ##
      # describe is 'defined' in Object
      # therefore it is available anywhere
      # so that allows us to simply
      # alias feature to describe.
      alias :feature :describe

    end
  end

  module Spec::DSL
    ##
    # Pure simple old Ruby#Module alias method
    #
    alias :scenario :it
    alias :background :before
    alias :given :let
  end

end

Object.send(:include, Minitest::Features::DSL)
