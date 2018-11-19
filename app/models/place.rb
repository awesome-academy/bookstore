class Place < ApplicationRecord
  scope :select_places, -> { select :name, :description, :latitude, :longitude }
end
