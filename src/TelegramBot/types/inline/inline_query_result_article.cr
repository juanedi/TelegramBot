require "json"

module TelegramBot
  class InlineQueryResultArticle < InlineQueryResult
    JSON.mapping({
      type:                  String,
      id:                    String,
      title:                 String,
      input_message_content: InputMessageContent,
      reply_markup:          {type: InlineKeyboardMarkup, nilable: true},
      url:                   {type: String, nilable: true},
      hide_url:              {type: Bool, nilable: true},
      description:           {type: String, nilable: true},
      thumb_url:             {type: String, nilable: true},
      thumb_width:           {type: Int32, nilable: true},
      thumb_height:          {type: Int32, nilable: true},
    })

    def initialize(@id : String, @title : String, @input_message_content : InputMessageContent, @reply_markup = nil, @url = nil, @hide_url = nil, @description = nil, @thumb_url = nil, @thumb_width = nil, @thumb_height = nil)
      @type = "article"
    end
  end
end
