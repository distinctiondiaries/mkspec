module Mkspec

  class Matcher

  end

  class LeftHand

    def initialize(class_name, method_name, args)
      @class_name = class_name
      @method_name = method_name
      @args = args
    end

    def to(matcher)
      <<-EOF
describe #{@class_name} do
  subject {described_class.new}

  describe "##{@method_name}" do

    it "does something" do
      expect(subject.#{@method_name}("#{@args}")).to #{matcher}
    end

  end
end
      EOF
    end
  end

  def expect(sut, method, args)
    LeftHand.new(sut.class.name, method, args)
  end

  def eq(expected)
    "eq(#{expected})"

  end

end
