class AddUniqueIndexForCrawlerField < ActiveRecord::Migration[8.0]
  def change
    add_index :crawler_fields, [:field_name, :crawl_market_id], unique: true
  end
end
