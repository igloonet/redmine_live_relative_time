module RedmineLiveRelativeTime
  module Hooks
    class AppendMomentJavascriptHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return javascript_include_tag('moment.min.js', :plugin => 'redmine_live_relative_time')
      end
    end
    class AppendRUMomentLocaleJavascriptHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return javascript_include_tag('ru.js', :plugin => 'redmine_live_relative_time')
      end
    end
    class AppendLiveStampJavascriptHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return javascript_include_tag('livestamp.js', :plugin => 'redmine_live_relative_time')
      end
    end
  end
end
