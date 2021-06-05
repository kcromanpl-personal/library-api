class Book < ApplicationRecord
  belongs_to :author

  validates :author, presence: true
  validates :title, :genre, :pages, presence: true
end
