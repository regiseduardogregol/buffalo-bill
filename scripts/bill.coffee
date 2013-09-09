greetings = ["Opa", "Olá", "Oi", "e aew", "maoe", "mavai"]
module.exports = (robot) ->
  robot.hear /^(opa|e aew|oi|bom dia|boa tarde|olá|ola|maoe|mavai)$/i, (msg) ->
    msg.reply msg.random greetings

