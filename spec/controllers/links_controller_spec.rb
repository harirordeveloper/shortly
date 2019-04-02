require "rails_helper"

RSpec.describe LinksController, type: :controller do
  describe "GET home" do
    it "has a 200 status code" do
      get :home
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    context 'with valid URL' do
      it "It creates a link in the DB" do
        expect do
           post :create, xhr: true, params: { link: { original_url: 'http://google.com' } }
        end.to change(Link, :count).by 1
      end
    end

    context 'with Invalid URL' do
      it "It does not create link in DB" do
        expect do
           post :create, xhr: true, params: { link: { original_url: 'google' } }
        end.to_not change(Link, :count)
      end
    end
  end

  describe "GET short_url" do
    context 'with valid Short URL' do
      before do
        @link = FactoryBot.create(:link)
      end

      it "It creates a link in the DB" do
        get :short_url, params: { token: @link.slug }
        expect(response).to redirect_to(@link.original_url)
      end
    end

    context 'with Invalid URL' do
      it "It redirects to 404 page" do
        get :short_url, params: { token: 0000 }
        expect(response).to redirect_to('/404')
      end
    end

    context 'with Expired URL' do
      before do
        @link = FactoryBot.create(:link, created_at: 40.days.ago)
      end

      it "It redirects to 404 page" do
        get :short_url, params: { token: @link.slug }
        expect(response).to redirect_to('/404')
      end
    end
  end

  describe "GET stats" do
    context 'with valid Short URL' do
      before do
        @link = FactoryBot.create(:link)
      end

      it "It creates a link in the DB" do
        get :stats
        expect(response.status).to eq(200)
      end
    end
  end
end
