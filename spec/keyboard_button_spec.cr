require "./spec_helper"

describe TelegramBot::KeyboardButton do
  pending "can be built from json" do
    json = <<-JSON
    {
      "text": "Button Text",
      "request_contact": true,
      "request_location": false
    }
    JSON
    parser = JSON::PullParser.new("{\"text\": \"Button Text\"}")

    button = TelegramBot::KeyboardButton.new(parser)

    button.text.should eq("Button Text")
    button.request_contact.should eq(true)
    button.request_location.should eq(false)
  end
end
