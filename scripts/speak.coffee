# Description:
#   Send speak command to rattishberrypi to ring them chimes
#
# Commands:
#   hubot speak <text> - Send command with desired message to pi

module.exports = (robot) ->
  robot.respond /SPEAK (.*)$/i, (msg) ->
    robot.http("http://www.google.com").get() (err, res, body) ->
      msg.send body

