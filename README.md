Mkspec
======

Generate your Ruby specs straight from your REPL

Whilst mucking around in your Ruby REPL (probably Pry), you decide you
need a spec to describe your next great feature. Instead of jumping back
to your editor, just type:

    require 'mkspec'
    include Mkspec
    
    expect(calculator, :calculate, "1+1").to(eq(1+1))

and it will generate:

    describe Calculator do
      subject {described_class.new}

      describe "#calculate" do

        it "does something" do
          expect(subject.calculate("1+1")).to eq(2)
        end

      end
    end

WIP
===

That's all it does right now. It's a simple DSL for generating RSpec
specs. If it proves useful though, I'm thinking of adding the ability
to generate more types of specs and the ability to save your specs
straight into your project.
