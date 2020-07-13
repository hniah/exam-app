class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes#{@scope[:path]}", "#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  # draw :portal_routes
  draw :api_routes
end
