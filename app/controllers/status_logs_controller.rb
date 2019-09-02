class StatusLogsController < ApplicationController
  before_action :get_status_log, only: [:show]
  def index
      @status_logs = StatusLog.all
  end

  def show

  end

  private

  def get_status_log
    @status_log = StatusLog.find(params[:id])
  end
end
