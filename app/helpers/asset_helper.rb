# frozen_string_literal: true

module AssetHelper
  def page_action_class
    class_mappings = { 'create' => 'new', 'update' => 'edit' }
    class_mappings[controller.action_name] || controller.action_name
  end

  def page_wrapper
    "#{controller_name}-#{page_action_class}-container"
  end

  def javascript_init
    application_name  = Rails.application.class.parent_name
    js_namespace_name = controller.class.to_s.sub(/Controller$/, '')
                                  .underscore.tr('/', '_')
    js_function_name = page_action_class

    javascript_tag <<-JS
      #{application_name}.init();
      if(#{application_name}.#{js_namespace_name}) {
        if(#{application_name}.#{js_namespace_name}.init) { #{application_name}.#{js_namespace_name}.init(); }
        if(#{application_name}.#{js_namespace_name}.init_#{js_function_name}) { #{application_name}.#{js_namespace_name}.init_#{js_function_name}(); }
      }
    JS
  end
end
