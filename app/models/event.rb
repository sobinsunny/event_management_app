class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  validates :entry_fee, numericality: { greater_than_or_equal_to: 0 }
  validates :entry_fee, :title, :location, :event_date, presence: true

  scope :active, -> { where('event_date > ? ', Date.today) }
  scope :order_by_date, -> { order('created_at desc') }

  def is_expired?
    created_at < DateTime.now
  end
end
