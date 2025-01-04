class Loan < ApplicationRecord
  enum :status, { init: 0, pending: 1, approved: 2, rejected: 3 }, default: 0

  belongs_to :client

  validates :area, presence: true, numericality: { greater_than: 0 }
end
