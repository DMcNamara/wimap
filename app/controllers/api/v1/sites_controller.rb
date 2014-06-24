class Api::V1::SitesController < Api::ParentApiController

  def index
    respond_with Site.all
  end

  def routers
    site = Site.find_by_id(params[:site])
    if !site.nil?
      respond_with site.routers
    else
      result = "Invalid Site"
      status = 400
      respond_to do |format|
        format.html { render :text => result, :status => status }
        format.xml  { render :text => result, :status => status }
        format.json { render :text => result, :status => status }
      end
    end
  end

  def create
    site  = JSON.parse(params["site"])
    @site = Site.new(site)

    if @site.save
      result = "ok"
      status = 200
    else
      result = "fail"
      status = 400
    end
    
    respond_to do |format|
      format.html { render :text => result, :status => status }
      format.xml  { render :text => result, :status => status }
      format.json { render :text => result, :status => status }
    end
  end

end