class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article=Article.new(article_params)
    # @article.user=User.first
    if @article.save
      flash[:notice]="Article Added Successfully"
      redirect_to @article
    else
      render 'new',status:422
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice]="Article Updated Successfully"
      redirect_to @article
    else
      render 'edit',status:422
    end
  end

  def destroy
    @article.destroy
    flash[:notice]="Article Deleted Successfully"
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description,:author)
  end
end