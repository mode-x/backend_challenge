# frozen_string_literal: true

require 'webrick'
require 'csv'
require_relative 'body'
require_relative 'compute'

# Servlet
class Servlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.content_type = 'text/plain'
    response.status = 200
    response.body = body(request)
  end

  def body(request)
    Body.new(request.path, request.query['file']).result
  rescue ArgumentError => e
    e.message
  end
end

server = WEBrick::HTTPServer.new(Port: 8080)

server.mount '/', Servlet

trap('INT') { server.shutdown }

server.start
