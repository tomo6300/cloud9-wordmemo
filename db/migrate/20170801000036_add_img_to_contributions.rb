class AddImgToContributions < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :img, :string
  end
end
