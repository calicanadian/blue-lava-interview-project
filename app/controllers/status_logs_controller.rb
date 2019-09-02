class StatusLogsController < ApplicationController
  before_action :get_status_log, only: [:show]
  def index
      @status_logs = StatusLog.all
      @visits = JSON.parse(StatusLog.get_exact_visits.to_json, object_class: OpenStruct)
      p @visits.inspect
  end

  def show

  end

  private

  def get_status_log
    @status_log = StatusLog.find(params[:id])
  end
end
