class Api::V1::RoutersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :xml, :json
  def index
    @routers = Router.all

    respond_to do |format|
      format.xml  { render :xml => @routers }
      format.json { render :json => @routers }
    end
  end

  def create
    # puts params[:router]
    router = params.to_hash
    router.delete("format")
    router.delete("controller")
    router.delete("action")

    @router = Router.new(router)

    if @router.save
      respond_with @router, status: 200
    else
      format.html { render action: 'new' }
      format.json { render json: @router.errors, status: :unprocessable_entity }
    end
  end

end