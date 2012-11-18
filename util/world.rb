require_relative "./point"
require_relative "./stash"
require_relative "./you"
require_relative "./player"
require "ir_b"

class World
  attr_accessor :nearby_players, :nearby_stashes, :nearby_treasure
  attr_accessor :you
  attr_accessor :tiles

  DIRECTIONS = [:n, :nw, :ne, :e, :se, :s, :sw, :w]

  def initialize(state)
    @you = You.new(state["you"])

    @tiles = []
    updateTilesByXY

    @nearby_treasure = []
    for item in (state["items"] || []).select(&:is_treasure)
      @nearby_treasure.push Point.new(item)
    end

    @nearby_players = []
    for player in state["nearby_players"]
      @nearby_players.push Player.new(player)
    end
  end

  def valid_move_directions
    # build blocked_dirs
    blocked_dirs = []
    @tiles_by_xy.each do |coords_key, tile|
      x, y = coords_key.split(',').map(&:to_i)
      blocked_dirs << Point.new({x: x, y: y}).direction_from(you.position) if tile.type == 'wall'
    end

    # we can go anywhere not blocked
    DIRECTIONS - blocked_dirs
  end

  def updateTilesByXY
    @tiles_by_xy = {}
    for tile in @tiles
      x = tile.x
      y = tile.y
      coords_key = [x, y].join(',')
      @tiles_by_xy[coords_key] = tile
    end
  end
end
