# frozen_string_literal: true

class WebhooksController < ActionController::API
  def carts_update
    Rails.logger.info("DEBUG::------------------ carts_update #{ params } ------------------")
    # render json: {status: 'ok'}
  end

  def products_update
    Rails.logger.info("DEBUG::------------------ products_update #{ params } ------------------")
    # render json: {status: 'ok'}
  end
end
