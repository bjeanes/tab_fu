module TabFu
  class Tab
    def initialize(context, list_id)
      @context = context
      @list_id = list_id
    end

    def current_tab
      @context.instance_variable_get('@_current_tab')
    end
  
    def method_missing(tab, name, options = {})
      active_class = (tab.to_s == current_tab.to_s) ? " active" : ""
      text = active_class.blank? ? @context.link_to(name, options) : name
      "<li class=\"#{name}#{active_class}\"><span><span>#{text}</span></span></li>"
    end
  end
end