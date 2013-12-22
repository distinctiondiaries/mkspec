
class Expectation

  def initialize(class_name, method_name, args)
    @class_name = class_name
    @method_name = method_name
    @args = args
  end

  def to(matcher)
    @matcher = matcher
    self
  end

  def to_s
    <<-EOF
describe #{@class_name} do
  subject {described_class.new}

  describe "##{@method_name}" do

    it "does something" do
      #{@matcher.perform(action)}
    end

  end
end
    EOF
  end

  def action
    "subject.#{@method_name}#{parameters}"
  end

  private

  def parameters
    @args.any? ? "(#{arg_list})" : ""
  end

  def arg_list
    @args.map{|arg| serialise(arg) }.join(', ')
  end

  # Attempt to recreate the source-code to represent this argument in the setup
  # for our generated spec.
  def serialise(arg)
    if %w(Array Hash Float Fixnum String).include? arg.class.name
      arg.pretty_inspect.chop
    else
      guess_constructor arg
    end
  end

  # Don't recognise the type so we don't know how to recreate it
  # in source code. So we'll take a guess at what might work and
  # let the user fix it up if necessary.
  def guess_constructor(arg)
    "#{arg.class.name}.new(#{serialise(arg.to_s)})"
  end
end
