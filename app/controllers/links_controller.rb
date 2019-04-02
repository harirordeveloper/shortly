class LinksController < ApplicationController
  before_action :load_short_url, :check_if_link_expired, only: :short_url

  def create
    @url = Link.new(link_params)
    @url.save
    respond_to do |format|
      format.js
    end
  end

  def short_url
    AnalyticsService.track(@link, request.remote_ip)
    redirect_to @link.original_url
  end

  def home
    @link = Link.new
  end

  def stats
    @links = Link.all.includes(:analytics).decorate
  end

  private
    def link_params
      params.require(:link).permit(:original_url, :slug)
    end

    def load_short_url
      @link = Link.find_by(slug: params[:token])&.decorate
    end

    def check_if_link_expired
      if @link.blank? || @link.expired?
        redirect_to "/404"
      end
    end
end
