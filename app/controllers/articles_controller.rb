class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]



  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: "Artigo criado com sucesso!"
    else
      render :new
    end
  end

  # ArticlesController
def edit
  # Este método já deve encontrar o @article pelo before_action
end


  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Artigo atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Artigo excluído com sucesso!"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def correct_user
    redirect_to articles_path, alert: "Você não tem permissão para isso." unless @article.user == current_user
  end
end

