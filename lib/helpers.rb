module TabFu
  module HelperMethods
    def tabs(id = nil, &proc)
      id = id.nil? ? '' : " id=\"#{id}\""
      concat("<ul#{id}>", proc.binding)
      yield(Tab.new(self, id))
      concat('</ul>', proc.binding)
    end
    
    def tab(t)
      @_current_tab = t
    end
  end
end