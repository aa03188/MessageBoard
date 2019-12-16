class Message < ApplicationRecord
  # validates the content can't be empty
  validates :content, presence: true

  # associations
  belongs_to :user
  has_many :replies
end
