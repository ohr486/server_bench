class BenchController < ApplicationController
  def ping
    render text: "pong"
  end
end
