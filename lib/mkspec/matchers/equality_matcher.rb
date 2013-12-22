module Mkspec

  module Matchers


    class EqualityMatcher
      def initialize(expected)
        @expected = expected
      end

      def match(expectation)
        "expect(#{expectation.action}).#{expectation.inclination} eq(#{@expected})"
      end
    end

  end

end
