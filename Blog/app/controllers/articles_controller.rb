# By convention, CRUD actions are listed in this order:
#   index, show, new, edit, create, update and destroy
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # Init here b/c if @article is nil, @article.errors.any in the new.html.erb would show an error
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # Uncomment render to inspect :article passed from articles/new.html.erb:
      #   <ActionController::Parameters {"title"=>"some title", "text"=>"some text"} permitted: false>
      #   params returns an ActionController::Parameters object, allowing for access of keys w strings OR symbols
      #   This can be done before we create a Article model
    ### render plain: params[:article].inspect

    # After we create an Article model, we can save into the db.
    @article = Article.new(article_params)
    # SAMPLE: @article = #<Article id: nil, title: "some title", text: "some text", created_at: nil, updated_at: nil>

    if @article.save
      redirect_to @article
      # SAMPLE: <input type="submit" name="commit" value="Save Article" data-disable-with="Save Article" />
      #   If save was successful, redirect user to '/articles/:id'
      #   If save was unsuccessful (:id is nil)  redirect user to '/articles'
    else
      render 'new'
      # render passes @article object back to the new template.
      #   This rendering is done within the same request as the form submission,
      #   whereas the redirect_to will tell the browser to issue another request,
      #   and new.html.erb will be redisplayed.
    end

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # safety feature says that you must whitelist parameters
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
