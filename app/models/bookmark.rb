class Bookmark < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :url, presence: true,
                  format: /\A#{URI::regexp(%w(http https))}\z/

end
