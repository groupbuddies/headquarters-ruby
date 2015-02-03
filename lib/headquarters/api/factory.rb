module Headquarters
  class API
    module Factory
      def self.new(klass, **args)
        classify(klass).new(**args)
      end

      private

      def self.classify(klass)
        klass.to_s.split('::').inject(Headquarters) do |constant, child_klass|
          constant.const_get child_klass
        end
      end
    end
  end
end
