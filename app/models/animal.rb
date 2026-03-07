class Animal < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception

#   ADD IN NEW SCOP WHERE ACTIVE ONLY SHOWS WHEN is_deleted IS FLASE OR EMPTY
  scope :active, -> { where(is_deleted: [false, nil] )}
end
