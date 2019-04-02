module ApplicationHelper
  def short_redirect_url slug
    host = case Rails.env
              when 'development' then 'localhost'
              when 'production'  then  'shortly'
              when 'test' then 'testshortly'
            end
    options = { host: host }
    options.merge!(port: '3000') if Rails.env.development?
    Rails.application.routes.url_helpers.short_link_url(slug, options)
  end
end
