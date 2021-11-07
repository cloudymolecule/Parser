class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def create 
    data = parse_text(log_params)
    @new_log = Log.create(data)
    redirect_to home_path
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to logs_path
  end

  private

  def log_params
    params.require(:log)
  end
end
