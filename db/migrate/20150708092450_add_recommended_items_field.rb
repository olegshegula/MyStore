class AddRecommendedItemsField < ActiveRecord::Migration
  def change
    add_column :items,:recommended_item, :integer
  end
end
