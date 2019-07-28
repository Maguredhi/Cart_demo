class Order < ApplicationRecord
  has_many :order_items

  include AASM

  aasm column: :state do
    state :pending, initial: true
    state :paid, :shipping, :delivered, :returned, :refunded

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipping
    end

    event :delivering do
      transitions from: :shipping, to: :delivered
    end

    event :return do
      transitions from: [:delivered, :shipping], to: :returned
    end

    event :refund do
      transitions from: [:paid, :refunded], to: :refunded
    end
  end
end
