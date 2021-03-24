class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end


  # Read of CRUD
  def show
    @article = Article.find(params[:id])
  end

  # Create of CRUD but doesn't save new article
  def new
    @article = Article.new
  end

    # Create of CRUD saves new article
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end
  #take input from user (Dynamic)
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
