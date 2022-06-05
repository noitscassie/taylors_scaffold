module TaylorsScaffold
  module ErrorReporter
    extend ActiveSupport::Concern

    class_methods do
      def error(_error)
        # TODO: report this somewhere; no-op for now
      end
    end
  end
end
