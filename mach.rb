require 'rubygems'
require 'irc-socket'

IRCSocket.new("irc.iglooirc.com") do |irc|
  irc.nick "mach"
  irc.user "mach", 0, "*", "irc-socket bot"
  while line = irc.read
    data = line.split
    if data[0] == 'PING'
      irc.pong data[1]
    end
    # Wait until end of motd before attempting to join
    if data[1] == '001'
	irc.join "#igloo"
	irc.privmsg "#igloo", "fuck"
    end

    puts line
  end
end
