class ConnectionsController < ApplicationController
  layout :solve_layout

  def channel
  end

  def index
  end

  def solve_layout
    case params[:action]
      when 'channel'
        'blank'
      else
        'application'
    end
  end
end
