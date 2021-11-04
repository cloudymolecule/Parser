class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def show
  end

  def create 
    data = parse_text(log_params)
    @new_log = Log.create(data)
  end

  def destroy
  end

  private

  def log_params
    params.require(:log)
  end
end
