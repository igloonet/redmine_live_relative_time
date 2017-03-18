module RedmineRelativeTime
  module Hooks
    class AppendMomentJavascriptHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return javascript_include_tag('moment.js', :plugin => 'redmine_relative_time')
      end
    end
  end
end
