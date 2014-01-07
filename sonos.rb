#!/usr/bin/env ruby
require 'socket'

sock_file = "/tmp/sonos.sock"
socket = UNIXSocket.new(sock_file) 

case ARGV[0]
when "play"
  socket.puts "play"
  puts "playing: " + socket.gets
when "pause"
  socket.puts "pause"
  puts "Paused: " + socket.gets
when "now_playing"
  socket.puts "now_playing"
  puts socket.gets
else
  puts <<-EOF
sonos
Usage:
  sonos play
  sonos pause
  sonos now_playing
EOF
end

