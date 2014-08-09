class RoutersController < ApplicationController
  before_action :set_router, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource skip_load_resource only: [:create]
  # GET /routers
  # GET /routers.json
  def index
    @routers = Router.all
  end

  # GET /routers/1
  # GET /routers/1.json
  def show
  end

  # GET /routers/new
  def new
    @router = Router.new
  end

  # GET /routers/1/edit
  def edit
  end

  # POST /routers
  # POST /routers.json
  def create
    router_data = router_params
    created = 0
    total = 1
    if router_data.kind_of?(Array)
        total = router_data.size
        router_data.each do | json |
            if Router.new(json).save
                ++created
            end
        end
    else
        if Router.new(router_data).save
           created = 1
        end
    end

    respond_to do |format|
      if created > 1
        format.html { redirect_to @router, notice: '#{created}/#{total} Router#{created > 1 ? "s" : ""} successfully created.' }
        format.json { render action: 'show', status: :created, location: @router }
      else
        format.html { render action: 'new' }
        format.json { render json: @router.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routers/1
  # PATCH/PUT /routers/1.json
  def update
    respond_to do |format|
      if @router.update(router_params)
        format.html { redirect_to @router, notice: 'Router was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @router.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routers/1
  # DELETE /routers/1.json
  def destroy
    @router.destroy
    respond_to do |format|
      format.html { redirect_to routers_url }
      format.json { head :no_content }
    end
  end

  def destroy_all
    Router.destroy_all
    flash[:notice] = "You have removed all results!"
    redirect_to routers_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_router
      @router = Router.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def router_params
      params.require(:router).permit(:site_id, :x, :y, :z, :ssid, :uid, :power, :frequency) 
    end
end
