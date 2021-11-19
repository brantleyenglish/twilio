require "http"
require 'twilio-ruby'
require 'sinatra'


class MyApp < Sinatra::Base
  post '/' do
    body = params['Body'].downcase
    HTTP.post("https://hooks.slack.com/services/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", :json => {'text' => body})
    
    twiml = Twilio::TwiML::MessagingResponse.new do |r|
        r.message(body: 'Message: ' + body + " Sent to Slack.")
    end
    twiml.to_s
  end
  get '/' do
    send_file 'index.html'
  end
end
