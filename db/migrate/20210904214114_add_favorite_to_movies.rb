class AddFavoriteToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :favorite, :boolean
  end
end
