class ChatController < ApplicationController

  def my_chat
    # @prompt = ""
    @prompt = params[:prompt]
    client = OpenAI::Client.new
    response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: @prompt}], # Required.
        temperature: 0,
    })
    @response = response.dig("choices", 0, "message", "content")
  end

end
