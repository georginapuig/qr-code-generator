class PagesController < ApplicationController
  require 'rqrcode'

  def qr
    # https://rails-qr-code-generate.herokuapp.com/websites/visit?url= + https://www.google.com
    @url = ENV['URL'] + params[:url].to_s.valid?
    @qrcode = RQRCode::QRCode.new(@url)

    if params[:url].present?
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

  def visit
    @url = params[:url].to_s
    @website = Website.find_by(url: @url)

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
