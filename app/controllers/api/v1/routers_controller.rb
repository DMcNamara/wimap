class Api::V1::RoutersController < Api::ParentApiController

  def index
    respond_with Router.all
  end

  def create
    router = JSON.parse(params["router"])
    @router = Router.new(router)

    if @router.save
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