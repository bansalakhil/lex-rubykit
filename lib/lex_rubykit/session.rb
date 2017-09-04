module LexRubykit
  # Handles the session object in request.
  class Session
    attr_accessor :attributes
    def initialize (session_attributes)
      raise ArgumentError, 'Invalid Session' if session_attributes.nil? 
      session_attributes.blank? ? @attributes = Hash.new  : @attributes = session_attributes
    end

    # def user_defined?
    #   !@user.nil? || !@user['userId'].nil?
    # end

    # # Returns the user_id.
    # def user_id
    #   @user['userId'] if @user
    # end

    # def access_token
    #   @user['accessToken'] if @user
    # end

    # Check to see if attributes are present.
    def has_attributes?
      !@attributes.empty?
    end
  end
end