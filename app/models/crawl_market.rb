class CrawlMarket < ApplicationRecord
  serialize :crawler_paths, coder: YAML, type: Array

  has_many :crawler_fields, dependent: :destroy

  validates :name, :code, :crawler_paths, presence: true
  validates :name, :code, uniqueness: true

  accepts_nested_attributes_for :crawler_fields, allow_destroy: true

  before_save :remove_blank_paths

  def self.display_fields
    CrawlMarket.column_names - [
      "created_at",
      "updated_at",
      "price_tag_container",
      "create_order_btn_container"
    ]
  end

  def crawler_paths_normalize
    crawler_paths.map(&:values).flatten.join(", ")
  end

  private

  def remove_blank_paths
    self.crawler_paths = crawler_paths.reject(&:blank?)
  end
end
