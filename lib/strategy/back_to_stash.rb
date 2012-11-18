require_relative './base'

module Strategy
  class BackToStash < Base
    def use?
      # TODO: Only hang around stash if it contains treasure.
      true
    end

    def act
      if close_to_stash
        log('close to stash')
        random_walk
      else
        log('not close to stash')
        move_to_stash
      end
    end

    protected

      def close_to_stash
        # TODO: We want to make sure we're within two squares' distance.
        world.you.stash.distance_from(world.you.position) <= 2
      end

      def random_walk
        decide 'move', {dir: world.valid_move_directions.sample}
      end

      def move_to_stash
        # TODO: Write more complex pather, use it both here and in DropAtStash
        decide 'move', {dir: world.you.position.direction_from(world.you.stash)} #.direction_from(world.you.position)}
      end
  end
end
