class Reply < ApplicationRecord
  # validates the content can't be empty
  validates :content, presence: true

  # associations
  belongs_to :message
  belongs_to :user
end
