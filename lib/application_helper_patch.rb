module RedmineLiveRelativeTime
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable

      alias_method :time_tag_dead, :time_tag
      alias_method :time_tag, :time_tag_live
    end
  end

  module InstanceMethods
    def time_tag_live(time)
      text = distance_of_time_in_words(Time.now, time)
      if @project
        link_to(text, {:controller => 'activities', :action => 'index', :id => @project, :from => User.current.time_to_date(time)}, :title => format_time(time), :class => 'time-tag', data: { livestamp: time.to_i.to_s })
      else
        content_tag('abbr', text, :title => format_time(time), :class => 'time-tag', data: { livestamp: time.to_i.to_s })
      end
    end
  end
end
