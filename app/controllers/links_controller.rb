class LinksController < ApplicationController
  before_action :authorize

  def index
    @link = Link.new
  end
end
