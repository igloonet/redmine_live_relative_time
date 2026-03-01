module RedmineLiveRelativeTime
  module Patches
    module ApplicationHelperPatch
      def time_tag(time)
        return if time.nil?

        text = distance_of_time_in_words(Time.now, time)
        if @project
          link_to(text,
                  project_activity_path(@project, from: User.current.time_to_date(time)),
                  title: format_time(time),
                  class: 'time-tag',
                  data: { livestamp: time.to_i.to_s })
        else
          content_tag('abbr', text,
                      title: format_time(time),
                      class: 'time-tag',
                      data: { livestamp: time.to_i.to_s })
        end
      end
    end
  end
end
