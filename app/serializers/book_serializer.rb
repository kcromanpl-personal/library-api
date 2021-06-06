class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :pages
end
