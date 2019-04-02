# Valid link with analytic data

link = Link.create(original_url: 'https://shortlly.herokuapp.com/')

link.analytics.create(user_ip: 'test IP', country: 'India', region: 'Andhra', city: 'Hyderabad')


# Expired Link

link = Link.create(original_url: 'https://herokuapp.com/', created_at: 40.days.ago)

link.analytics.create(user_ip: 'test IP', country: 'India', region: 'Andhra', city: 'Hyderabad')
