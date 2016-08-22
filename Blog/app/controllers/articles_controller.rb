class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    # Uncomment render to inspect :article passed from articles/new.html.erb:
      #   <ActionController::Parameters {"title"=>"some title", "text"=>"some text"} permitted: false>
      #   params returns an ActionController::Parameters object, allowing for access of keys w strings OR symbols
      #   This can be done before we create a Article model
    ### render plain: params[:article].inspect

    # After we create an Article model, we can save into the db.
    @article = Article.new(article_params)
    @article.save
    # Redirect user to the show action
    redirect_to @article
  end

  # safety feature says that you must whitelist parameters
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
