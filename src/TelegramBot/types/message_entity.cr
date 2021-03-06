require "json"

module TelegramBot
  class MessageEntity
    JSON.mapping({
      type:   String,
      offset: Int32,
      length: Int32,
      url:    {type: String, nilable: true},
      user:   {type: User, nilable: true},
    })

    force_getter! type, offset, length, url, user
  end
end
