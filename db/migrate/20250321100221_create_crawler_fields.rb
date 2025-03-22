class CreateCrawlerFields < ActiveRecord::Migration[8.0]
  def change
    create_table :crawler_fields do |t|
      t.references :crawl_market, null: false, foreign_key: true
      t.string :field_name
      t.string :selector
      t.string :element_content_attr
      t.string :query_type

      t.timestamps
    end
  end
end
