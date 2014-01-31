class Api::V1::TracksController < Api::ParentApiController

  def index
    respond_with Track.all
  end

  def create
    track  = JSON.parse(params["track"])
    @track = Track.new(track)

    if @track.save
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