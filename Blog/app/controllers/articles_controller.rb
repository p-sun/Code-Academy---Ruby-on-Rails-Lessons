class ArticlesController < ApplicationController
  def new
  end

  def create
    # Inspect :article from aricles/new.html.erb, which returns
      # {"utf8"=>"✓",
      #  "authenticity_token"=>"J9z55HqXU41wAbzwI...",
      #  "article"=>{"title"=>"some title", "text"=>"some text"},
      #  "commit"=>"Save Article"}
    # params returns an ActionController::Parameters object, allowing for access of keys w strings OR symbols
    render plain: params[:article].inspect
  end
end
