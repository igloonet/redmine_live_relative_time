module RedmineLiveRelativeTime
  module Hooks
    class HeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context = {})
        javascript_include_tag('redmine_live_relative_time/livestamp', plugin: 'redmine_live_relative_time')
      end
    end
  end
end
