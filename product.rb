class Product < ApplicationRecord
  has_one_attached :featured_image
  has_rich_text :description
  belongs_to :brand

  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :brand, presence: true

  before_save :generate_short_description

  private

  def generate_short_description
    if description.body.to_plain_text.present?
      self.short_description = description.body.to_plain_text[0, 300]
    end
  end
end
