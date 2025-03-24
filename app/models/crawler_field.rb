class CrawlerField < ApplicationRecord
  serialize :selector, type: Array, coder: YAML

  enum :query_type, {
    class_relative: I18n.t("crawler_field.query_type_options.class_relative"),
    exactly_match: I18n.t("crawler_field.query_type_options.exactly_match"),
    url_search_param: I18n.t("crawler_field.query_type_options.url_search_param"),
    url_search_param_from_element: I18n.t("crawler_field.query_type_options.url_search_param_from_element"),
  }, default: :class_relative

  belongs_to :crawl_market
  validates :field_name, :selector, :query_type, :element_content_attr, presence: true
  validates :field_name, uniqueness: { scoped: [:crawl_market_id] }

  def selector_normalize
    selector.map do |i|
      i.is_a?(String) ? i : i.values
    end.flatten.join(", ")
  end
end
