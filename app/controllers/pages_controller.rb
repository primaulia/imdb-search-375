class PagesController < ApplicationController
  def home
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    else
      @results = []
    end
  end
end
