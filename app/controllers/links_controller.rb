class LinksController < ApplicationController
  before_action :authorize

  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link
      flash[:success] = "Successfully created link!"
      redirect_to links_path
    else
      render :new
    end
  end

  private

    def link_params
      params.require(:link).permit(:url, :title)
    end
end
