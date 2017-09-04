module LexRubykit
  # Handles the bot object in request.
  class DialogAction
    attr_accessor :type, :fulfillment_state, :message_content_type, :message_content

    DIALOG_ACTION_TYPES = {
      close: 'Close',
      confirm_intent: 'ConfirmIntent',
      delegate: 'Delegate',
      elicit_intent: 'ElicitIntent',
      elicit_slot: 'ElicitSlot'
    }

    FULFILMENT_STATES = {
      fulfilled: 'Fulfilled',
      failed: 'Failed'
    }

    MESSAGE_CONTENT_TYPE = {
      plain: 'PlainText',
      ssml: "SSML"
    }
    def initialize (type = DIALOG_ACTION_TYPES[:elicit_intent], fulfillment_state = FULFILMENT_STATES[:fulfilled], message_content_type = MESSAGE_CONTENT_TYPE[:plain], message_content = 'Message to convey')
      @type                 = type
      @fulfillment_state    = fulfillment_state
      @message_content_type = message_content_type
      @message_content      = message_content
    end

    def build_response_object(session_end)
      response = Hash.new
      response["type"] = session_end ? DIALOG_ACTION_TYPES[:close] : type
      response["fulfillmentState"] = fulfillment_state if response["type"] == DIALOG_ACTION_TYPES[:close]
      response['message'] = {
        'contentType' => message_content_type,
        'content' => message_content,
      }
      response
    end

    # def should_end_session
    #   self.type = 'Close'
    # end

  end
end
