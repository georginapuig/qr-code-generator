class PagesController < ApplicationController
  require 'rqrcode'

  def qr
    @url = params[:url].to_s
    @linkUrl = 'https://rails-qr-code-generate.herokuapp.com/websites/visit' + @url
    @qrcode = RQRCode::QRCode.new(@linkUrl)
    
    if params[:url].present?
      @svg = @qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 6,
        standalone: true
      )
    else
      @svg = @qrcode.as_svg(
        module_size: 7
      )
    end
  end

  def visit
    @url = params[:url].to_s
    @linkUrl = 'https://rails-qr-code-generate.herokuapp.com/websites/visit' + @url
    @website = Website.find_by(url: @linkUrl)

    if @website
      @website.visits += 1
      @website.save
    else
      @website = Website.new(url: @url, visits: 1)
      @website.save
    end

    redirect_to @url
  end
end
