class StrategyStack

  attr_accessor :stack

  def initialize(strategies)
    self.stack = strategies || []
    raise "Needs at least one Strategy" if self.stack.empty?
  end

  # Returns ['action name', {action: data}]
  def act(world)
    update_strategies!(world)

    stack.each do |strategy|
      if strategy.use?
        return strategy.act
      end
    end
    stack.last.act # Default to the last if none apply.
  end

  protected

    # thats some functional shit right there yo
    # mutate the fuck out of everything
    def update_strategies_with_world!(world)
      stack.each { |s| s.world = world }
    end
end
