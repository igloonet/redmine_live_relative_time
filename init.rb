Redmine::Plugin.register :redmine_live_relative_time do
  name 'Redmine Live Relative Time'
  author 'igloonet'
  description 'Live-updating relative timestamps on Redmine pages'
  version '2.0.0'
  url 'https://git.igloonet.cz/redmine/redmine_live_relative_time'
end

# Note: init.rb is already executed inside to_prepare by Redmine::PluginLoader.
# Do NOT wrap in another to_prepare -- that causes double-nesting and the prepend
# only takes effect on the next prepare cycle (which may never come in rails runner).
unless ApplicationHelper.ancestors.include?(RedmineLiveRelativeTime::Patches::ApplicationHelperPatch)
  ApplicationHelper.prepend(RedmineLiveRelativeTime::Patches::ApplicationHelperPatch)
end

require_relative 'lib/redmine_live_relative_time/hooks/head_hook'
