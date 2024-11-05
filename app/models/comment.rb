class Comment < ApplicationRecord
  # Associação com o modelo User e Article
  belongs_to :user
  belongs_to :article
end


