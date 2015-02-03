require 'spec_helper'

module Headquarters
  class API
    describe Factory do
      class ::Headquarters::FakeClass < API
        namespace :fake_nested_class
      end

      context '.new' do
        it 'creates an instance of the given class' do
          instance = Factory.new(:FakeClass)

          expect(instance.class).to eq(::Headquarters::FakeClass)
        end
      end
    end
  end
end
