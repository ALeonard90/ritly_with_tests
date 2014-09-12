class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = Link.all
  end

  def create
    @link = Link.create(link_params)
    redirect_to root_path
  end

  def redirect
    @link = Link.find_by_short_code(params[:short_code])
    redirect_to @link.url
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end