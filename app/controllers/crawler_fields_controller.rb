class CrawlerFieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_crawl_market

  def index; end

  def create
    selector = JSON.parse selector_params rescue []
    @crawler_field = @crawl_market.crawler_fields.build(crawler_field_params.merge(selector:))

    if @crawler_field.save
      flash.now[:notice] = "Crawler field created successfully."
    else
      flash.now[:alert] = "Crawler field create failure. #{@crawler_field.errors.full_messages}"
    end
  end

  def update
    selector = JSON.parse selector_params rescue []
    @crawler_field = @crawl_market.crawler_fields.find(params[:id])

    if @crawler_field.update(crawler_field_params.merge(selector:))
      flash.now[:notice] = "Crawler field updated successfully."
    else
      flash.now[:alert] = "Crawler field update failure."
    end
  end

  private

  def load_crawl_market
    @crawl_market = CrawlMarket.find(params[:crawl_market_id])
  end

  def selector_params
    params.require(:crawler_field).fetch(:selector, [])
  end

  def crawler_field_params
    params.require(:crawler_field).permit(
      :field_name,
      :query_type,
      :element_content_attr,
      selector: []
    )
  end
end
