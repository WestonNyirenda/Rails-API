class Article < ApplicationRecord

    validates :title, presence: true
    validates :title, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :body, presence: true


    has_many :coments
end
