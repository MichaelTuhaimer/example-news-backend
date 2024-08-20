class ArticlesController < ApplicationController
  def index
    response = HTTP
      .headers("X-Api-Key" => ENV["NEWS_API_KEY"])
      .get("https://newsapi.org/v2/everything?q=#{params[:search_terms]}")
    data = response.parse
    render json: data["articles"].uniq { |article| article["title"] }
  end
end
