Sonos
=====

I was sick of waiting for an official Sonos client app to arrive for Linux, so
I looked around for a reverse engineered version someone might've made. I came
across [the beginnings of just what I wanted](https://github.com/soffes/sonos), but
it was a bit unpolished, and not quite what I wanted - I wanted a socket server I could
query.

So I wrote a small wrapper around [soffes'](https://github.com/soffes) work, and wrote a
little socket server which allows me to integrate sonos into my desktop environment nicely.

Currently only play, pause and now_playing are implemented, although it'd be
trivial to add more functionality that's exposed to us via [soffes' Sonos
gem](https://github.com/soffes/sonos).
