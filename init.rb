require 'redmine'
require 'application_helper_patch'
require_dependency 'hooks/append_javascript_head_hook'

Redmine::Plugin.register :redmine_live_relative_time do
  name 'Redmine Live Relative Time'
  author 'David Manda, igloonet.cz'
  url 'https://github.com/igloonet/redmine_live_relative_time.git'
  author_url 'https://igloonet.cz'
  description 'Little plugin which auto update relative times (1 minute ago) as times go.'
  version '1.1'

  Rails.configuration.to_prepare do
    ApplicationHelper.send(:include, RedmineLiveRelativeTime)
  end
end
