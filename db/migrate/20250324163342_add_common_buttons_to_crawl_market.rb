class AddCommonButtonsToCrawlMarket < ActiveRecord::Migration[8.0]
  def change
    add_column :crawl_markets, :create_order_btn_container, :string
    add_column :crawl_markets, :price_tag_container, :string
  end
end
