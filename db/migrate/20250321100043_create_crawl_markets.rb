class CreateCrawlMarkets < ActiveRecord::Migration[8.0]
  def change
    create_table :crawl_markets do |t|
      t.string :name, index: true
      t.string :code, index: true
      t.text :crawler_paths
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
