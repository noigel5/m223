class Package < ApplicationRecord
  validates :sender, presence: true
  validates :recipient, presence: true
  validates :content, presence: true
  validates :weight, presence: true

  def self.update_with_lock(id, new_attributes)
    record = find(id)

    # Acquire a lock on the record
    record.lock!
  end
end