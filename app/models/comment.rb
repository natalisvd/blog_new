class Comment < ActiveRecord::Base
  belongs_to :post
  delegate :user, :to => :post
  validates  :body, presence: true,
            length: { minimum: 1 }
end
