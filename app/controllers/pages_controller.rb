class PagesController < ApplicationController
  require 'rqrcode'

  def home
    @qrcode = RQRCode::QRCode.new(params[:link].to_s)

    if params[:link].present?
      @svg = @qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 4,
        standalone: true
      )
    else
      @svg = @qrcode.as_svg(
        module_size: 7
      )
    end
  end
end
