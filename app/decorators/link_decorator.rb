class LinkDecorator < Draper::Decorator
  delegate_all

  %W(country city postal_code).each do |action|
    define_method("top_#{action.pluralize}") do
      analytics.pluck(action.to_sym).uniq.join(',')
    end
  end

  def expired?
    created_at <= Link::EXPIRY_DAYS.days.ago
  end
end
