greetings = ["Opa", "Olá", "Oi", "e aew", "maoe"]
module.exports = (robot) ->
  robot.hear /(opa|e aew|oi|bom dia|boa tarde|olá|ola|maoe)/i, (msg) ->
    msg.reply msg.random greetings
