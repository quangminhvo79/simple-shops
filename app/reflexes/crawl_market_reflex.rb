# frozen_string_literal: true

class CrawlMarketReflex < ApplicationReflex
  def toggle
    crawl_market = CrawlMarket.find(element.dataset.id)
    if crawl_market.update(enabled: !crawl_market.enabled)
      flash.now[:notice] = "Market updated successfully"
    else
      flash.now[:alert] = "Market update failed"
    end
  end
end
