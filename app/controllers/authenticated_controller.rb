# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  layout 'shopify_portal'
  include ShopifyApp::Authenticated
end
