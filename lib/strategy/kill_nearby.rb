require_relative './base'

module Strategy
  class KillNearby < Base
    def use?
      world.nearby_players.any?
    end
    def act
      player = world.nearby_players.first
      if next_to_player(player)
        attack_player(player)
      else
        move_to_player(player)
      end
    end

    protected

      def next_to_player(player)
        player.distance_from(world.you.position) < 2
      end

      def attack_player(player)
        decide 'attack', {dir: world.you.position.direction_from(player)}
      end

      def move_to_player(player)
        decide 'move', {dir: world.you.position.direction_from(player)}
      end
  end
end
