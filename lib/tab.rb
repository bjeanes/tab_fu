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
      active_class = (tab.to_s == current_tab.to_s) ? "class=\"active\" " : ""
      text = active_class.blank? ? @context.link_to(name, options) : name
      "<li #{active_class}id=\"nav_#{tab.to_s}\"><span><span>#{text}</span></span></li>"
    end
  end
end