require_relative 'spec_helper'


describe Mkspec do

  it "is a DSL for building specs" do
    class SystemUnderTest
    end
    sut = SystemUnderTest.new

    sut.extend described_class
    expect(sut.expect(sut, :calculate, "1+1").to(sut.eq(1+1)).to_s).to eq(
      <<-GENERATED_SPEC
describe SystemUnderTest do
  subject {described_class.new}

  describe "#calculate" do

    it "does something" do
      expect(subject.calculate("1+1")).to eq(2)
    end

  end
end
      GENERATED_SPEC
    )
  end


  it "can generate specs for methods with varying arity and parameter types" do
    class CustomType
      def initialize(str)
        @value = str.to_i
      end

      def to_s
        @value.to_s
      end
    end
    class SystemUnderTest
    end
    sut = SystemUnderTest.new

    sut.extend described_class
    expect(sut.expect(sut, :calculate, CustomType.new('1'), '+', 5.4, {formats:[:pdf, 'html']}).to(sut.eq(1+5.4)).to_s).to eq(
      <<-GENERATED_SPEC
describe SystemUnderTest do
  subject {described_class.new}

  describe "#calculate" do

    it "does something" do
      expect(subject.calculate(CustomType.new("1"), "+", 5.4, {:formats=>[:pdf, "html"]})).to eq(6.4)
    end

  end
end
      GENERATED_SPEC
    )
  end

end
