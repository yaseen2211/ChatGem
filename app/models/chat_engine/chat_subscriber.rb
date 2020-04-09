module ChatEngine
  class ChatSubscriber < ApplicationRecord
    belongs_to :chat
    belongs_to :subscriber, polymorphic: true
    scope :remaining_subscriber_ids, ->(user_id) {where("subscriber_id !=?",user_id).pluck(:subscriber_id)}
    scope :get_except_array, ->(excepted_array) {where("chat_id NOT IN (?)",excepted_array).pluck(:subscriber_id).uniq}
  end
end
