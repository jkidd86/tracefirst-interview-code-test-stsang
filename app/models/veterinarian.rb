class Veterinarian < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception

#   ADD IN NEW SCOP WHERE ACTIVE ONLY SHOWS WHEN is_deleted IS FLASE OR EMPTY
  scope :active, -> { where(is_deleted: [false, nil] )}

#   ADD VALID INTERNATIONAL NUMBER CHECK
  validates :number, format: { with:  /\A\+[1-9]\d{1,14}\z/, message: " must be valid international phone number format"}
end
