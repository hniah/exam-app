module Api
  module V1
    class ShopifyController < Api::BaseController

      def delivery_times
        render_json(data: {postal_code: postal_code, items: delivery_times_items})
      end

      def testing
        render_json(data: {postal_code: postal_code, items: delivery_times_items})
      end

      private

      def postal_code
        params.require(:postal_code)
      end

      def delivery_times_items
        tmp = [Time.zone.now + 2.days, Time.zone.now + 3.days, Time.zone.now + 4.days, Time.zone.now + 5.days]
        tmp.map{|t| t.strftime('%d %b %Y %H:%M')}
      end
    end
  end
end

