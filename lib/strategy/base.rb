module Strategy
  class Base

    attr_accessor :world

    def use?
      false
    end

    def act
      # eg. decide('move', {dir: 'n'})
    end

    protected

      # Returns ['action name', {action: data}]
      def decide(action, data)
        [action, data]
      end
  end
end
