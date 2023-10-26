class Package < ApplicationRecord
  validates :absender, presence: true
  validates :empfänger, presence: true
  validates :inhalt, presence: true
  validates :gewicht, presence: true
end
