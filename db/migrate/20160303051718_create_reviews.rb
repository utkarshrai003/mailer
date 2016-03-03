class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :review
      t.string :product

      t.timestamps null: false
    end
  end
end
