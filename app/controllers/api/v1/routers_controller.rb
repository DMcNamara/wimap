class Api::V1::RoutersController < Api::ParentApiController

  def index
    
    respond_with Router.all
  end

  def samples
    router = Router.find_by_id(params[:router])
    if !router.nil?
      respond_with router.distance_samples
    else
      result = "Invalid Router"
      status = 400
      respond_to do |format|
        format.html { render :text => result, :status => status }
        format.xml  { render :text => result, :status => status }
        format.json { render :text => result, :status => status }
      end
    end
  end

  def create
    router_data = JSON.parse(params["router"])
    count = 0
    total = 1
    if router_data.kind_of?(Array)
      total = router_data.size
      router_data.each do | router |
        #router = JSON.parse(json_str)
        if Router.new(router).save
          ++count;
        end
      end
    else
      if Router.new(router_data).save
        count = 1
      end
    end
    if count > 0
      result = "ok"
      status = 200
    else
      result = "fail"
      status = 400
    end

    respond_to do |format|
      format.html { render :text  => result, :status => status }
      format.xml  { render :text  => result, :status => status }
      format.json { render :text => result, :status => status }
    end
  end

end
