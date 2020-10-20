class PagesController < ApplicationController
  require 'rqrcode'

  def qr
    @website = Website.create(url_params)
    
    if @website.save
      # https://rails-qr-code-generate.herokuapp.com/websites/visit?url= + https://www.google.com
      @url = ENV['URL'] + @website[:url].to_s
      @qrcode = RQRCode::QRCode.new(@url)

      @svg = @qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 4,
        standalone: true
      )
    end
  end

  def visit
    @url = url_params[:url].to_s
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

  private

  def url_params
    params.permit(:url)
  end
end
