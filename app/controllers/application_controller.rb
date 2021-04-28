class ApplicationController < ActionController::API

  def not_found
     render :json => {:error => "Not found"}.to_json, :status => 404
  end
end
