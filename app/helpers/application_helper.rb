module ApplicationHelper
  def sidebar_items
    [
      {
        title: "Setting",
        icon_name: "cog",
        url: root_path
      },
      {
        title: "Exchange Rates",
        icon_name: "dollar-circle",
        url: root_path
      },
      {
        title: "Crawl Markets",
        icon_name: "archive",
        url: root_path
      },
      {
        title: "Bank Account",
        icon_name: "bank",
        icon_type: "solid",
        url: root_path
      }
    ]
  end
end
