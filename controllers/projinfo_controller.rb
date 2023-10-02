require 'etc'
class ProjinfoController < ApplicationController
  include ActionController::Live
  # GET /support?session_id=<session_UUID>
  # session_id [UUID] optional session to add data to the support ticket
  def index
    projinfo = Projinfo.new()
    @user_projects = projinfo.main
    respond_to do |format|
      format.html do
        render :index
      end
    end
  end
end
