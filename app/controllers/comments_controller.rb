class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @article, notice: "Comentário criado com sucesso!"
    else
      redirect_to @article, alert: "Erro ao criar comentário."
    end
  end

  def edit
    #@comment = Comment.find(params[:comment_id]) if params[:comment_id] # se você está editando um comentário
  end
  

  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: "Comentário atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @article, notice: "Comentário excluído com sucesso!"
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content) # Certifique-se que isso está correto
  end

  def correct_user
    redirect_to @article, alert: "Você não tem permissão para isso." unless @comment.user == current_user
  end
end
