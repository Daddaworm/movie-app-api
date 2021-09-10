class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :mpaa_rating,:overview, :poster_url, :trailer_url, :favorite, :category_id

  belongs_to :category
end
