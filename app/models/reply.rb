class Reply < ApplicationRecord
  # associations
  belongs_to :message
  belongs_to :user
end
