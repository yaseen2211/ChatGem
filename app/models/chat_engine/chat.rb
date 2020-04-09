module ChatEngine
  class Chat < ApplicationRecord
    has_many :chat_subscribers,dependent: :destroy
    has_many :subscribers, through: :chat_subscribers
    has_many :messages, dependent: :destroy
    scope :sort_by_messages, ->{joins(:messages).order('chat_engine_messages.created_at DESC').uniq}
    scope :get_active_subscriber_ids, ->(user_id) {joins(:chat_subscribers).where("chat_engine_chat_subscribers.subscriber_id =?", user_id).pluck(:id)}
  end
end
