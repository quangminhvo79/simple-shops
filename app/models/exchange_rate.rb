class ExchangeRate < ApplicationRecord
  SUPPORTED_CURRENCIES = %i[usd eur cny vnd]

  validates :currency_code, :rate, presence: true
  validates :currency_code, uniqueness: true
end
