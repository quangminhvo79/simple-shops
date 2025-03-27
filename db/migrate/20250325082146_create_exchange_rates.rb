class CreateExchangeRates < ActiveRecord::Migration[8.0]
  def change
    create_table :exchange_rates do |t|
      t.string :currency_code
      t.string :rate

      t.timestamps
    end
  end
end
