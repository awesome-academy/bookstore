class Emotion < ApplicationRecord
  include PublicActivity::Model
  tracked
  belongs_to :user
  belongs_to :recipent, polymorphic: true
end
