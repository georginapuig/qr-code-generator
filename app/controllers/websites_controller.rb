class WebsitesController < ApplicationController
  require 'rqrcode'

  before_action :find_by_url, only: [:qr, :visit]

  def qr
    if find_by_url.nil?
      # if url is valid
      @website = Website.create(url: url_params[:url], visits: 0)
    end
    
    if @website
      # @url = https://rails-qr-code-generate.herokuapp.com/websites/visit?url= + https://www.google.com
      @url = ENV['URL'] + @website[:url].to_s
      # create qr code
      @qrcode = RQRCode::QRCode.new(@url)
      # display svg
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
    if find_by_url
      @website.visits += 1
      @website.save
    end

    redirect_to @url
  end

  private

  def find_by_url
    @website = Website.find_by(url: url_params[:url].to_s)
  end

  def url_params
    params.permit(:url)
  end
end
