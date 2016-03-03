class AddColumnToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :picture, :binary
  end
end
