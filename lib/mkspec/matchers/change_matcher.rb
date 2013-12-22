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

      def perform(action)
        %Q{expect{ #{action} }.to change(#{@obj}, :count).by(#{@quantity})}
      end

    end

  end
end

