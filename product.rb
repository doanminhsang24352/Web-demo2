class Product < ApplicationRecord
  include ProductNotifications  # Keep the module name that suits your application

  has_many :subscribers, dependent: :destroy
  has_one_attached :featured_image
  has_rich_text :description

  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }

  # Notify subscribers only when the product comes back in stock
  after_update_commit :notify_subscribers, if: :back_in_stock?

  # Check if the product was out of stock and is now back in stock
  def back_in_stock?
    inventory_count_previously_was&.zero? && inventory_count > 0
  end

  # Notify all subscribers when the product is back in stock
  def notify_subscribers
    subscribers.each do |subscriber|
      ProductMailer.with(product: self, subscriber: subscriber).in_stock.deliver_later
    end
  end
end
