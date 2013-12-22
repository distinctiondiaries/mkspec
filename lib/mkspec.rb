require_relative "mkspec/expectation"
require_relative "mkspec/matchers/equality_matcher"
require_relative "mkspec/matchers/change_matcher"

module Mkspec

  def expect(sut, method, *args)
    Expectation.new(sut.class.name, method, args)
  end

  def eq(expected)
    Matchers::EqualityMatcher.new(expected)
  end

  def change(obj, method)
    Matchers::ChangeMatcher.new(obj, method)
  end

end
