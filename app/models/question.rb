class Question < ApplicationRecord
  belongs_to :author, class_name: User, foreign_key: :user_id
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  # has_one :best_answer, class_name: Answer

  validates_presence_of :title, :description

end
