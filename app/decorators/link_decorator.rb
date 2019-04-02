class LinkDecorator < Draper::Decorator
  delegate_all

  def top_countries
    analytics.pluck(:country).uniq.join(',')
  end

  def expired?
    created_at <= Link::EXPIRY_DAYS.days.ago
  end
end
