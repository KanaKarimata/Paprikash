class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true

  validates :title, presence: true
end
