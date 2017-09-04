module LexRubykit
  # Handles the bot object in request.
  class Bot
    attr_reader :name, :alias, :version
    def initialize (bot)
      raise ArgumentError, 'Invalid bot' if bot.nil? || bot['name'].nil? || bot['alias'].nil? || bot['version'].nil?
      @name    = bot['name']
      @alias   = bot['alias']
      @version = bot['version']
    end
  end
end