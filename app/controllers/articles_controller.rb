class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end

  def edit
    unless @article.user == current_user
      flash[:alert] = "You can only edit your own articles."
      redirect_to root_path
    end
  end

  def update
    if @article.user == current_user
      if @article.update(article_params)
        flash[:success] = "Article has been updated"
        redirect_to @article
      else
        flash.now[:danger] = "Article has not been updated"
        render :edit
      end
    else
      flash[:danger] = "You can only edit your own article."
      redirect_to root_path
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article has been deleted"
      redirect_to articles_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:body, :title)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
