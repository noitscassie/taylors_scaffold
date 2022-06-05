module TaylorsScaffold
  module Service
    extend ActiveSupport::Concern

    class Result
      SUCCESS = :success
      FAILURE = :failure

      class << self
        def success!(**args)
          new(status: SUCCESS, extra: args)
        end

        def failure!(status: FAILURE, **args)
          new(status:, extra: args)
        end
      end

      attr_reader :status, :extra

      def initialize(status:, extra: {})
        @status = status
        @extra = extra.symbolize_keys

        report_errors!
      end

      def success?
        status == SUCCESS
      end

      def failure?
        status != SUCCESS
      end

      private

      def method_missing(method_name, *_args, &)
        extra.each do |key, value|
          return value if key == method_name
        end

        nil
      end

      def respond_to_missing?
        true
      end

      def report_errors!
        return unless extra[:error]

        ::TaylorsScaffold::ErrorReporter.error(error)
      end
    end

    class_methods do
      def call(*args, **kwargs)
        new(
          *args,
          **kwargs,
        ).call
      end
    end
  end
end
