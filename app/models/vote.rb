class Vote < ApplicationRecord
  belongs_to :voter, class_name: User, foreign_key: :user_id
  belongs_to :voteable, polymorphic: true

  validates_uniqueness_of :voter, scope: [:voteable_id, :voteable_type]
end
