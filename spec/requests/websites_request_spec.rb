require 'rails_helper'

RSpec.describe "Websites", type: :request do
  describe "GET websites#qr" do
    it "should get qr" do
      get '/websites/qr'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET websites#qr" do
    it "renders home" do
      get '/websites/qr'
      expect(response).to render_template("websites/qr")
    end
  end

  describe "GET websites#visit" do
    it "redirects to @url" do
      get '/websites/visit'
      expect(response).to redirect_to(assigns(:url)) 
    end
  end
end
