class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :overview, :poster_url
end
