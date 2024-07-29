class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except:[:show,:home]
  before_action :require_same_user,only: [:edit, :update,:destroy]
  def show
  end

  def home
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 6)
  end

  def new
    @article = Article.new
  end

  def create
    @article=Article.new(article_params)
    @article.user=current_user
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
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description,:author)
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can't edit or delete #{@article.user.username}'s article."
      redirect_to @article
    end
  end
end