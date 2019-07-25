require 'rack'

Rack::Mime::MIME_TYPES.merge!({
  ".wasm"     => "application/wasm",
})

#my_rack = lambda { |env| [200, {}, ["Hello.  The time is: #{Time.now}"]] }
handler = Rack::Handler::WEBrick

#handler.run(my_rack, :Port => 8000)

handler.run Rack::File.new(".")