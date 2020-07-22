module RedmineLiveRelativeTime
  module Hooks
    class AppendMomentJavascriptHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return javascript_include_tag('moment.min.js', :plugin => 'redmine_live_relative_time')
      end
    end
  end
end
