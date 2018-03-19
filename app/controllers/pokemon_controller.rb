class PokemonController < ApplicationController
  def show
     res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
     body = JSON.parse(res.body)
     id    = body["id"]
     name  = body["name"]
     type = body["types"][0]["type"]["name"]


     result = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{name}&rating=g")
     body_gyphy = JSON.parse(result.body)
     gif_url = body_gyphy["data"][0]["url"]
     render json: { "id": id,
                   "name": name,
                   "type": type,
                   "url": gif_url}
   end
end
