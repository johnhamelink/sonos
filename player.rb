require 'rubygems'
require 'sonos'

class Player

  attr_accessor :system

  def initialize
    self.system = Sonos::System.new

    [1..5].each do
      if self.system.speakers.size == 0
        puts "Rescanning for speakers"
        self.system.rescan
      end
    end

    fail "Could not connect to Sonos" if system.speakers.size == 0
    self
  end

  def speaker
    system.speakers.first
  end

  def play
    speaker.play
  end

  def pause
    speaker.pause
  end

  def now_playing
    now_playing = speaker.now_playing

    if now_playing[:album] == "" && now_playing[:artist] == ""
      out = "Radio: #{now_playing[:info]}"
    else
      out = "#{now_playing[:artist]} - #{now_playing[:album]} - #{now_playing[:title]}"
    end

    out
  end

end
