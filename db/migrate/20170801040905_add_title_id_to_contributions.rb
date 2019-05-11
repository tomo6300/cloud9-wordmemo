class AddTitleIdToContributions < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :title, :string
    add_column :contributions, :linkTitle, :string
    add_column :contributions, :url, :string
  end
end
