class Emotion < ApplicationRecord
  include PublicActivity::Common
  belongs_to :user
  belongs_to :recipent, polymorphic: true
end
