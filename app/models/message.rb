class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  validates :content, presence: true
  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  def self.get_all(user_id)
    where("sender_id = ? OR receiver_id = ?", user_id, user_id).order(created_at: :desc)
  end

  def self.get_all_conv(user_id)
    msgs = self.get_all(user_id)
    convs = {}
    msgs.map do |msg|
      if msg.sender_id != user_id
        chater_id = msg.sender_id
        chater_state = true
      else
        chater_id = msg.receiver_id
        chater_state = false
      end
      if not convs.key?(chater_id)
        conv = {}
        conv["chater"] = chater_state ? msg.sender : msg.receiver
        conv["msgs"] = [msg]
        convs[chater_id] = conv
      else
        convs[chater_id]["msgs"].push msg
      end
    end
    return convs
  end
end
