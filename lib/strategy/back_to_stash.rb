require_relative './base'

module Strategy
  class BackToStash < Base
    def use?
      # TODO: Only hang around stash if it contains treasure.
      true
    end

    def act
      if close_to_stash
      end
    end

    protected

      def close_to_stash
        false
      end
  end
end
