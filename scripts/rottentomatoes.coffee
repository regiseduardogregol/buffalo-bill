# Description
#   Find a random movie on rotten tomatoes top 50
#
# Dependencies:
#   http
#
# Configuration:
#   HUBOT_ROTTEN_TOMATOES_KEY
#
# Commands:
#   hubot tell me a movie
#
# Notes:
#
#
# Author:
#   lucasmerencia

http = require('http')
key = process.env.HUBOT_ROTTEN_TOMATOES_KEY;

module.exports = (robot) ->
  robot.respond /tell me a movie/i, (msg) ->
    if key
      options = {
        host: "api.rottentomatoes.com",
        path : "/api/public/v1.0/lists/dvds/top_rentals.json?limit=50&apikey="+key
      }

      request = http.get options, (res) ->
        result = ""
        res.on 'data', (chunk) ->
          result += chunk

        res.on 'end', () ->
          result = JSON.parse(result)
          movies = result.movies
          index = Math.floor(Math.random() * movies.length)
          movie = movies[index]
          message = "#{movie.title}, released in #{movie.year}.\n"
          message+= "Time: #{movie.runtime}\n"
          message+= "Critics Score: #{movie.ratings.critics_score}\n"
          message+= "Audience Score: #{movie.ratings.audience_score}"
          msg.send message

      request.on 'error', (e) ->
        msg.send "Sorry but I can't tell you a movie."
        msg.send e.message
    else
      msg.send "Give me a Rotten Tomatoes First!"
