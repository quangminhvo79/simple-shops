class CrawlMarketsController < ApplicationController
  before_action :authenticate_user!
  def index
    @crawl_markets = CrawlMarket.all
  end

  def edit
    @crawl_market = CrawlMarket.find(params[:id])
  end

  def create
    @crawl_market = CrawlMarket.new(crawl_market_params)
    @crawl_market.crawler_paths = JSON.parse crawl_market_paths rescue crawl_market_paths

    if @crawl_market.save
      flash.now[:notice] = "Market created successfully"
      render :create
    else
      render(turbo_stream: turbo_stream.update(
        :crawl_market_errors,
        partial: "shared/errors",
        locals: { errors: @crawl_market.errors.full_messages.join("\n") }
      ))
    end
  end

  def update
    @crawl_market = CrawlMarket.find(params[:id])
    crawler_paths = JSON.parse(crawl_market_paths) rescue crawl_market_paths

    if @crawl_market.update(crawl_market_params.merge(crawler_paths:))
      flash.now[:notice] = "Market updated successfully"
    else
      flash.now[:alert] = "Market update failed"
    end
  end

  def destroy
    @crawl_market = CrawlMarket.find(params[:id])

    if @crawl_market.destroy
      flash.now[:notice] = "Market deleted successfully"
    else
      flash.now[:alert] = "Market deleted failed"
    end
  end

  private

  def crawl_market_params
    params.require(:crawl_market).permit(:name, :code, :enabled, crawler_paths: [])
  end

  def crawl_market_paths
    params.require(:crawl_market).fetch(:crawler_paths, [])
  end
end
