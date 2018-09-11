# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  artwork_id :integer          not null
#

class Comment < ApplicationRecord 
  validates :user_id, :artwork_id, :body, presence: true
  
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
  
  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
  
end
