class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:new, :create]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    if user_signed_in?
      @my_articles = current_user.articles.where.not(status: :deleted).order(created_at: :desc)
    else
      @my_articles = Article.published_articles.order(created_at: :desc)
    end
  end

  def show
    # CanCanCan will automatically check permissions
    # If unauthorized, it will raise AccessDenied exception
  end

  def new
    @article = current_user.articles.build
    authorize! :create, @article
  end

  def create
    @article = current_user.articles.build(article_params)
    authorize! :create, @article

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # CanCanCan will handle authorization
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.status = "deleted"
    @article.save
    redirect_to articles_path, notice: 'Article was successfully deleted.'
  end

  private

  def check_owner
    redirect_to articles_path, alert: 'Not authorized.' unless @article.user == current_user
  end

  def article_params
    params.require(:article).permit(:title, :body, :status, :image)
  end
end
