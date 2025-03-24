# frozen_string_literal: true

class CrawlerFieldReflex < ApplicationReflex
  def destroy
    crawler_field = CrawlerField.find_by(
      id: element.dataset.crawler_field,
      crawl_market_id: element.dataset.crawl_market
    )
    if crawler_field.destroy
      flash.now[:notice] = "Crawler Field destroyed"
    else
      flash.now[:alert] = "Crawler Field destroy failed"
    end
  end
end
