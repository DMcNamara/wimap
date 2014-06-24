class DistanceSamplesController < ApplicationController
  before_action :set_distance_sample, only: [:show, :destroy]
  
  def index
    params = distance_samples_selector_params
    @set_hash = {}
    filtered_samples = DistanceSample.all
    filtered_samples.keep_if! do |sample|
      site_valid = true
      router_valid = true
      if params.has_key?(:site_id)
        site_valid = (sample.site_id == params[:site_id])
      end
      if params.has_key?(:router_id)
        router_valid = (sample.router_id == params[:router_valid])
      end
      site_valid && router_valid
    end

    filtered_samples.each do |sample|
      if set_hash.has_key?(sample.set_id)
        @set_hash[sample.set_id] << sample
      else
        @set_hash[sample.set_id] = [sample]
      end
    end

  end

  def show
  end

  # GET /distancesamples/new
  def new
    @distance_sample = DistanceSample.new
  end

  def create
    @distance_sample = DistanceSample.new(distance_samples_params)

    respond_to do |format|
      if @distance_sample.save
        format.html { redirect_to @distance_sample, notice: 'Sample Saved' }
        format.json { render action: 'show', status: :created, location: @distance_sample }
      else
        format.html { render action: 'new' }
        format.json { render json: @distance_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @distance_sample.destroy
    respond_to do |format|
      format.html { redirect_to distance_samples_url }
      format.json { head :no_content }
    end
  end

  private

  def set_distance_sample(params)
    @distance_sample = DistanceSample.find(params[:id])
  end

  def distance_samples_params(params)
    params.require(:site_id, :router_id, :set_id).permit(:distance, :power, :timestamped, :time)
  end

  def distance_samples_selector_params(params)
    params.permit(:site_id, :router_id)
  end
end
