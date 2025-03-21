# frozen_string_literal: true

class CounterReflex < ApplicationReflex
  def increment
    @count = element.dataset.count.to_i + element.dataset.step.to_i
  end

  def change
    morph "#foo", element.value
  end
end
