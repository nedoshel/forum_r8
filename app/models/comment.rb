class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true, touch: true
  belongs_to :comment, optional: true
  has_many :comments, dependent: :nullify
end
