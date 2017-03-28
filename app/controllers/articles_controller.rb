class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :authenticate_user!, except: [:index, :show]

  # Renders all articles
  def index
    @articles = Article.all
  end

  # Renders a single articles
  def show
    @article = find_article
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  # Defines a new article
  def new
    @article = Article.new
  end

  # Renders the create article page
  def create
    @article = Article.new(article_params)
    if user_signed_in?
      @article.user_id = current_user.id
    end
    if @article.save
      flash[:notice] = "Article '#{@article.title}' Created!"
    else
      flash.alert = "Error creating post!"
      render :new
    end

    redirect_to article_path(@article)
  end

  # Deletes an article
  def destroy
    @article = find_article
    if @article.destroy
      flash.notice = "Article '#{@article.title}' Deleted!"
    else
      flash.alert = "Error deleting post!"
    end

    redirect_to articles_path
  end

  # prepares article for editing
  def edit
    @article = find_article
  end

  # Renders the edit article page
  def update
    @article = find_article
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  # Find specified article
  def find_article
    @article = Article.find(params[:id])
  end
end
