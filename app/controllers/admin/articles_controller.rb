class Admin::ArticlesController < ApplicationController

  before_filter :get_site, :should_be_logged_in, :should_own_site

  def index
    @articles = @site.articles #Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  def create
    @article = @site.articles.build(params[:article])
    if @article.save
      redirect_to admin_site_article_path(@site, @article), :notice => "Article created"
    else
      redirect_to new_admin_site_article_path(@site)
      flash[:error] = "Something bad happened and the article was not created"
    end
  end
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to admin_site_article_path(@site, @article), :notice => "Article saved"
    else
      redirect_to new_admin_site_article_path(@site)
      flash[:error] = "Something bad happened and the article was not saved"
    end
  end

  private
end
