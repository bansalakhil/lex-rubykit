require 'lex_rubykit/request'
require 'lex_rubykit/version'
require 'lex_rubykit/response'
require 'lex_rubykit/intent_request'
require 'lex_rubykit/response/dialog_action'
require 'lex_rubykit/session_ended_request'

module LexRubykit
  # Prints a JSON object.
  def self.print_json(json)
    p json
  end

  # Prints the Gem version.
  def self.print_version
    p LexRubykit::VERSION
  end

  # Returns true if all the Lex request objects are set.
  def self.valid_lex?(request_json)
    !request_json.nil? && !request_json['sessionAttributes'].nil? &&
        !request_json['messageVersion'].nil? && !request_json['bot'].nil? && !request_json['invocationSource'].nil?
  end
end