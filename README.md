Mkspec
======

Generate your Ruby specs straight from your REPL

Whilst mucking around in your Ruby REPL (probably Pry), you decide you
need a spec to describe your next great feature. Instead of jumping back
to your editor, just type:

    extend Mkspec
    
    puts expect(calculator, :calculate, "1+1").to(eq(1+1))

and it will generate:

    describe Calculator do
      subject {described_class.new}

      describe "#calculate" do

        it "does something" do
          expect(subject.calculate("1+1")).to eq(2)
        end

      end
    end
    
You can then copy and paste that spec into a file and edit to taste. It's not perfect but it does give you a headstart with some of the boiler-plate.

Motivation
==========

The advantage of generating the spec from within Pry is that you are working with real values from the calling method. This enables you to just put `binding.pry` at the top of a method you need to implement and generate a realistic spec for it based on the values it actually received when called.


Installation
============

Add this to your Gemfile:

    gem 'mkspec'

and run bundle at the command prompt to install it:

    bundle


Usage
=====

Where possible, mkspec syntax follows that of RSpec so it will hopefully be familiar.

    expect(object_to_test, method, params...).to eq(expected_value)


It uses Ruby's PrettyPrint to serialise `params` and `expected_value` so it correctly serializes Hashes and Arrays.

See the specs for more examples of usage.


Bugs
====

Mkspec does what it can to create a useful spec from the values it can introspect. It doesn't always get it right though so you'll very likely need to edit the generated spec a little.

WIP
===

That's all it does right now. It's a simple DSL for generating RSpec
specs. If it proves useful though, I'm thinking of adding the ability
to generate more types of specs and the ability to save your specs
straight into your project.
