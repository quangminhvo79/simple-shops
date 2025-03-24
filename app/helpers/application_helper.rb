module ApplicationHelper
  def sidebar_items
    [
      {
        title: "Setting",
        icon_name: "cog",
        active_class: nil,
        url: root_path
      },
      {
        title: "Exchange Rates",
        icon_name: "dollar-circle",
        active_class: nil,
        url: root_path
      },
      {
        title: "Crawl Markets",
        icon_name: "archive",
        active_class: ["crawl_markets", "crawler_fields"].include?(controller_name) ? "menu-active" : nil,
        url: crawl_markets_path
      },
      {
        title: "Bank Account",
        icon_name: "bank",
        icon_type: "solid",
        active_class: nil,
        url: root_path
      }
    ]
  end
end
