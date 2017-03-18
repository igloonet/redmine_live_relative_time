require 'redmine'
require 'application_helper_patch'
require_dependency 'hooks/append_moment_javascript_head_hook'

Redmine::Plugin.register :redmine_relative_time do
  name 'Redmine Relative Time'
  author 'David Manda'
  url 'https://git.igloonet.cz/redmine/redmine_relative_time.git'
  author_url 'https://github.com/Dejv6'
  description 'Plugin zobrazuje a mění relativní časy (před 3 hodinami apod.) živě pomocí Javascriptu.'
  version '1.0'

  Rails.configuration.to_prepare do
    ApplicationHelper.send(:include, RelativeTime)
  end

end
