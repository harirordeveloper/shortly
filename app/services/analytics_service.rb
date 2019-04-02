require 'geocoder'

class AnalyticsService
  attr_accessor :user_ip

  def self.track link_rec, user_ip
    @user_ip = user_ip
    link_rec.analytics.create(geo_loc_obj)
  end

  def self.geo_loc_obj
    rec = Geocoder.search(@user_ip).first
    analytic_data rec
  end

  def self.analytic_data rec
    {
      user_ip: @user_ip,
      city: rec.city,
      region: rec.region,
      country: rec.country,
      postal_code: rec.postal
    }
  end
end
