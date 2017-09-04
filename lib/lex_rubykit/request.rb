module LexRubykit
  class Request
    require 'json'
    require 'lex_rubykit/session'
    require 'lex_rubykit/bot'

    attr_accessor :message_version, :bot, :session, :json, :json_mash # global
    attr_accessor :invocation_source, :user_id, :output_dialog_mode, :input_transcript, :confirmation_status # on request

    def initialize(json_request)
      @message_version    = json_request['messageVersion']
      @invocation_source  = json_request['invocationSource']
      @user_id            = json_request['userId']
      @output_dialog_mode = json_request['outputDialogMode']
      @input_transcript   = json_request['inputTranscript']
      @confirmation_status   = json_request['confirmationStatus']
      @json               = json_request
      @json_mash          = Hashie::Mash.new(@json)
      @session            = LexRubykit::Session.new(json_request['sessionAttributes'])
      @bot                = LexRubykit::Session.new(json_request['bot'])
    end
  end

  # Builds a new request for Lex.
  def self.build_request(json_request)
    raise ArgumentError, 'Invalid Lex Request.' unless LexRubykit.valid_lex?(json_request)
    @request = nil
    @request = IntentRequest.new(json_request)
    @request
  end

  # Take keys of hash and transform those to a symbols
  def self.transform_keys_to_symbols(value)
    return value if not value.is_a?(Hash)
    hash = value.inject({}){|memo,(k,v)| memo[k.to_sym] = self.transform_keys_to_symbols(v); memo}
    return hash
  end
end
