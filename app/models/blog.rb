class Blog < ApplicationRecord
  #enum es como una variable booleana, toma valor 1  o 0
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
end
