module TabFu
  module Helpers

    include TabFu::ListHelper  

    def tabs(id = '__default')
      html_id = id.nil? || id == '__default' ? '' : " id=\"#{id}\""
      concat("<ul#{html_id}>")
      yield(List.new(self, id))
      concat('</ul>')
    end

  end
end