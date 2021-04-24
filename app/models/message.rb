class Message < ApplicationRecord
  belongs_to :seeker, optional: true
  belongs_to :recuitor, optional: true

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
