module Mkspec

  module Matchers


    class EqualityMatcher
      def initialize(expected)
        @expected = expected
      end

      def perform(action)
        "expect(#{action}).to eq(#{@expected})"
      end
    end

  end

end
