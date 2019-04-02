# == Schema Information
#
# Table name: analytics
#
#  id          :bigint(8)        not null, primary key
#  user_ip     :string
#  city        :string
#  region      :string
#  country     :string
#  postal_code :string
#  link_id     :bigint(8)
#

class Analytic < ApplicationRecord
  belongs_to :link

  after_create :update_link_visit_count

  def update_link_visit_count
    link.update(link_visited_count: link.link_visited_count + 1)
  end
end
