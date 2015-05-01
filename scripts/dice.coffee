module.exports = (robot) ->
  robot.respond /(\d+)[dD](\d+)(\s*)/i, (msg) ->
    num = msg.match[1]
    dice = msg.match[2]
    msg.send report msg, roll num,dice

report = (msg, results) ->
  results.sort (a, b) ->
    a - b
  result = results.reduce (a, b) -> (a + b)
  "\[#{results}\] = #{result}"

roll = (num, dice) ->
  rollOne(dice) for i in [0...num]

rollOne = (dice) ->
  1 + Math.floor(Math.random() * dice)
