class AddLinkVisitedCount < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :link_visited_count, :integer, default: 0
  end
end
