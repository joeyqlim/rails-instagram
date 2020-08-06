class TagsController < ApplicationController
  def def show
    @tag = Tag.find(params[:id])
  end
end
