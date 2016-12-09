class Question < ApplicationRecord
  belongs_to :author, class_name: User, foreign_key: :user_id
  has_one :best_answer, class_name: Answer
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates_presence_of :title, :description

end
