# == Schema Information
#
# Table name: links
#
#  id                 :bigint(8)        not null, primary key
#  original_url       :string
#  short_url          :string
#  slug               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  link_visited_count :integer          default(0)
#

class Link < ApplicationRecord

  default_scope { order(created_at: :desc) }

  EXPIRY_DAYS = 30

  validates :original_url, presence: true, url: true

  before_create :generate_slug

  has_many :analytics, dependent: :destroy

  private

    def generate_slug
      self.slug = rand(36**5).to_s(36)
    end
end
