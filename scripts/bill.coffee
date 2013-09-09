
greetings = ["Opa", "Olá", "Oi", "e aew"]
module.exports = (robot) ->
  robot.hear /^(opa|e aew|oi|bom dia|boa tarde|olá|ola)$/i, (msg) ->
    msg.reply msg.random greetings