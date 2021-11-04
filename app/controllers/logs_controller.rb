class LogsController < ApplicationController
  def index
  end

  def show
  end

  def create #here
    data = parse_text(log_params)
    byebug
  end

  def destroy
  end

  private

  def log_params
    params.require(:log)
  end
end
