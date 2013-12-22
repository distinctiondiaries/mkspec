module Mkspec

  module Matchers

    class ChangeMatcher

      def initialize(obj, method)
        @obj = obj
        @method = method
      end

      def by(quantity)
        @quantity = quantity
        self
      end

      def match(expectation)
        %Q{expect{ #{expectation.action} }.#{expectation.inclination} change(#{@obj}, :count).by(#{@quantity})}
      end

    end

  end
end

