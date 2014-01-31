class Api::ParentApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :xml, :json
end