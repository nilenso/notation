class Note < ApplicationRecord
  belongs_to :user

  scope :search_by_title_or_body, ->(substring) { where("title ILIKE ? OR body ILIKE ? ", "%#{substring}%", "%#{substring}%") }
end
