# frozen_string_literal: true

class ExchangeRateReflex < ApplicationReflex
  before_reflex :exchange_rate
  before_reflex :initialize_values

  def update_currency_code
    exchange_rate.rate = 0 unless exchange_rate.persisted?

    if exchange_rate.update(currency_code: element.value)
      render_success({ notice: "Update successfully" })
    else
      render_error
    end
  end

  def update_rate
    exchange_rate.currency_code = "USD" unless exchange_rate.persisted?

    if exchange_rate.update(rate: element.value)
      render_success({ notice: "Update successfully" })
    else
      render_error
    end
  end

  def new
    morph "#new_exchange_rate_form", render(partial: "exchange_rates/form", locals: {
      exchange: ExchangeRate.new,
      selected_id: nil
    })
  end

  private

  def exchange_rate
    @exchange_rate ||= ExchangeRate.find_or_initialize_by(id: element.dataset.id)
  end

  def initialize_values
    return if exchange_rate.persisted?

    @new_exchange_rate = true
  end

  def render_success(flash_object)
    morph "#toast", render(partial: "layouts/toast", locals: flash_object)
    if @new_exchange_rate
      morph "#new_exchange_rate_form", nil
      morph "#exchange-rates", render(partial: "form", collection: ExchangeRate.all, as: :exchange, locals: { selected_id: nil })
    else
      morph "#exchang-rate-#{exchange_rate&.to_gid_param}", "#{exchange_rate.currency_code} - #{exchange_rate.rate}"
    end
  end

  def render_error
    morph "#toast", render(partial: "layouts/toast", locals: { alert: exchange_rate.errors.full_messages.join(", ") })
  end
end
