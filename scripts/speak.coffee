# Description:
#   Send speak command to radishberrypi to ring them chimes
#
# Commands:
#   hubot speechify <text> [--quiet] - Send normal with desired message to pi
#   hubot shameify <text> [--quiet] - Send shaming with desired message to pi
#   hubot praisify <text> [--quiet] - Send praiseful with desired message to pi

parse_message = (message) ->
  temp_message = message.replace('--quiet', '')
  [temp_message != message, temp_message]

call_api = (robot, msg, message, amplify, endpoint) ->
  url = "http://radish.kapost.com/#{endpoint}?message=" + encodeURIComponent(message) + "&amplify=" +encodeURIComponent(amplify)
  robot.http(url).get() (err, res, body) ->
    if err || (res.statusCode != 200)
      msg.send 'Failed'
    #else
      #msg.send 'Success'

module.exports = (robot) ->

  robot.respond /speechify (.*)$/i, (msg) ->
    [is_quiet, message] = parse_message(msg.match[1])
    call_api(robot, msg, message, !is_quiet, 'speechify')

  robot.respond /shameify (.*)$/i, (msg) ->
    [is_quiet, message] = parse_message(msg.match[1])
    call_api(robot, msg, message, !is_quiet, 'shameify')

  robot.respond /praisify (.*)$/i, (msg) ->
    [is_quiet, message] = parse_message(msg.match[1])
    call_api(robot, msg, message, !is_quiet, 'praisify')

