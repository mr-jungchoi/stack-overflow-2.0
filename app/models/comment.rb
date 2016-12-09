class Comment < ApplicationRecord
  belongs_to :commenter, class_name: User, foreign_key: :user_id
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true

  validates_presence_of :text
  
end
