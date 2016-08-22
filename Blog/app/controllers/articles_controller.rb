class ArticlesController < ApplicationController
  def new
  end

  def create
    # Use this to inspect :article passed from articles/new.html.erb:
    #   <ActionController::Parameters {"title"=>"some title", "text"=>"some text"} permitted: false>
    #   params returns an ActionController::Parameters object, allowing for access of keys w strings OR symbols
    render plain: params[:article].inspect
  end
end
