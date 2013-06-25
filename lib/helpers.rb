require 'nanoc-sprockets-filter'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Capturing
include Nanoc::Helpers::Sprockets

def is_current_item(target)
  item.identifier == target
end

def options_for_dates(date_text)
  options = ''

  date_text.lines.map(&:chomp).each do |line|
    options += '<option value="' + line + '">' + line + '</option>'
  end

  options
end
