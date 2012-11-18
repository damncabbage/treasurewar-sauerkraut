require_relative './base'

module Strategy
  class DropAtStash < Base
    def use?
      world.you.carrying_treasure
    end
    def act
      if on_stash
        drop_treasure
      else
        move_to_stash
      end
    end

    protected

      def on_stash
        world.you.position == world.you.stash
      end

      def drop_treasure
        decide 'drop'
      end

      def move_to_stash
        # TODO: Write more complex pather, use it both here and in BackToStash
        decide 'move', {dir: world.you.position.direction_from(world.you.stash)}
      end
  end
end
