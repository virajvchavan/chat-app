# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :text
#

class User < ApplicationRecord
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'to_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'from_id'

  validates :username, presence: true
  validates :username, uniqueness: true

  def all_messages
    (sent_messages + received_messages).sort_by {|m| m[:created_at]}
  end

end
