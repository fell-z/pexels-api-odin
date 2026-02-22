class StaticPagesController < ApplicationController
  def index
    if params.has_key? :collection_id
      p = Pexels.new

      response = p.search(params[:collection_id])
      @photos = p.photos(response)
    end
  end
end
