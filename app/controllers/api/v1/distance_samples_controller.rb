class Api::V1::DistanceSamplesController < Api::ParentApiController

  def index
    respond_with DistanceSample.all
  end

  def create
    sample = JSON.parse(params["sample"])
    @sample = DistanceSample.new(sample)

    if @sample.save
      result = "ok"
      status = 200
    else
      result = "fail"
      status = 400
    end

    respond_to do |format|
      format.html { render :text  => result, :status => status }
      format.xml  { render :text  => result, :status => status }
      format.json { render :text  => result, :status => status }
    end
  end

end