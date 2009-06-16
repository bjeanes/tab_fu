module TabFu
  module Helpers

    include TabFu::ListHelper  

    def tabs(options = {})
      id = options.delete(:id) || '__default'
      html_id = id.nil? || id == '__default' ? '' : " id=\"#{id}\""
      concat("<ul#{html_id}>")
      yield(List.new(self, id, options))
      concat('</ul>')
    end

  end
end