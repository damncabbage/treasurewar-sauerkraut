require 'SocketIO'
require_relative './util/world'
Dir['lib/**/*.rb'].each { |f| require f }

hostname = ARGV[0] || 'localhost'
client = SocketIO.connect("http://#{hostname}:8000") do
  before_start do

    # Instantiated now and kept around so that
    # individual strategies can hang on to previous
    # state for record-keeping if needed.
    stack = StrategyStack.new([
      Strategy::DropAtStash.new,
      Strategy::KillNearby.new,
      Strategy::PickUpNearby.new
      Strategy::BackToStash.new
    ])

    on_message {|message| puts "incoming message: #{message}"}

    # You have about 1 second between each tick
    on_event('tick') { |game_state|
      puts "Tick received #{game_state.inspect}"

      world = World.new(game_state.first)
      emit(*stack.act(world))


      # Valid commands:
      # emit("move", {dir: "n"})
      # emit("attack", {dir: "ne"})
      # emit("pick up")
      # emit("throw", {dir: "ne"})
    }
  end

  after_start do
    emit("set name", "Sauerkraut")
  end
end
