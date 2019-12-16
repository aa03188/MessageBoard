class Message < ApplicationRecord
  # associations
  belongs_to :user
  has_many :replies
end
