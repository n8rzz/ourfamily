class RemovePostFromImage < ActiveRecord::Migration
  def change
    remove_reference :images, :post
  end
end
