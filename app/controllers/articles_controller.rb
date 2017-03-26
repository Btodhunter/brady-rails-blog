class ArticlesController < ApplicationController
  def index
    # lists all articles
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
