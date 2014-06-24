class NavpointsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def navpoint_params(params)
    params.require(:site_id).permit(:navpoint)
end
