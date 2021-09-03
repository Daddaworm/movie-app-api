class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :mpaa_rating
      t.string :poster_url
      t.string :trailer_url
      t.integer :category_id

      t.timestamps
    end
  end
end
