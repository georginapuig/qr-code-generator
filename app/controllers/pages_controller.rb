class PagesController < ApplicationController
  require 'rqrcode'

  def home
    @qrcode = RQRCode::QRCode.new(params[:link].to_s)

    @svg = @qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 8,
      standalone: true
    )
  end

  # private

  # def link_params
  #   params.require(:qrcode).permit(:link)
  # end
end
