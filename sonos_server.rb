#!/usr/bin/env ruby
require './player'
require 'socket'

player = Player.new

sock_file = "/tmp/sonos.sock"
File.unlink sock_file if File.exists?(sock_file) && File.socket?(sock_file)
server = UNIXServer.new sock_file

loop do
  socket = server.accept
  while(req = socket.gets) do
    case req.chomp.downcase
    when "now_playing"
      socket.puts player.now_playing
    when "pause"
      player.pause
      socket.puts "true"
    when "play"
      player.play
      socket.puts "true"
    else
      socket.puts "narp"
    end
  end
end
