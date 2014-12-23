class DeleteLoginCategoryFormItems < ActiveRecord::Migration
  def change
    remove_column :items,:category
  end
end
