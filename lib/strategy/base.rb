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
        log_decision(action, data)
        [action, data]
      end

      def log(message)
        Logger.debug self.class.name, message
      end

      def log_decision(action, data)
        Logger.debug self.class.name, "#{action} with #{data}"
      end
  end
end
