require "open-uri"

class GamesController < ApplicationController
  def new
    @letters_array = []
    10.times{ @letters_array.push(('A'..'Z').to_a.sample) } 
  end

  def score
    #  retrieve array of letters
    
    # check if the word exist
    if params[:word]
      word = params[:word]
      json_serialized = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{word}").read)
      ## if it exists checks the length of it
      if json_serialized["found"] == true
        @message = "Congratulations #{word} exists"
      else
        @message = "Your word #{word} doesn't exist"
      end
    
    end
  end
end
