class Article < ApplicationRecord
  # Associação com o modelo User
  belongs_to :user

  # Associação com comentários
  has_many :comments, dependent: :destroy
end

