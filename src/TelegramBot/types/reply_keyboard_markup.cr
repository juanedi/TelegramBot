require "json"

module TelegramBot
  class KeyboardButton
    getter text
    getter request_contact
    getter request_location

    @text : String
    @request_contact : Bool?
    @request_location : Bool?

    def initialize(@text, @request_contact = nil, @request_location = nil)
    end

    def initialize(parser : JSON::PullParser?)
      # TODO
      # We normally should need to parse keyboard markup from the telegram API
      # Still, we should allow to create instances from json to comply with
      # JSON.mapping's requirements 
      @text = ""
      @request_contact = nil
      @request_location = nil
      raise "Not implemented"
    end

    def to_json(io : IO)
      if @request_contact.nil? && @request_location.nil?
        @text.to_json(io)
      else
        io.json_object do |json|
          json.field("text", @text)
          json.field("request_contact", @request_contact) unless @request_contact.nil?
          json.field("request_location", @request_location) unless @request_location.nil?
        end
      end
    end
  end

  class ReplyKeyboardMarkup
    FIELDS = {
      keyboard:          Array(Array(KeyboardButton)),
      resize_keyboard:   {type: Bool, nilable: true},
      one_time_keyboard: {type: Bool, nilable: true},
      selective:         {type: Bool, nilable: true},
    }

    JSON.mapping({{FIELDS}})

    initializer_for({{FIELDS}})

    # Alternative constructor that allows to build markup object with text-only buttons
    def initialize(keyboard : Array(Array(String)), resize_keyboard : Bool? = nil, one_time_keyboard : Bool? = nil, selective : Bool? = nil)
      buttons = keyboard.map { |row| row.map { |text| KeyboardButton.new(text) } }
      initialize(buttons, resize_keyboard, one_time_keyboard, selective)
    end
  end
end
