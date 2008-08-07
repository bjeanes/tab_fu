# TabFu

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

  def tab(name)
    @_current_tab = name
  end
  
  def self.included(klass)
    ApplicationHelper.send(:include, TabFu::HelperMethods)
    
    klass.module_eval do
      def self.tab(name, opts = {})
        before_filter(opts) do |c|
          c.instance_variable_set(:@_current_tab, name)
        end
      end
    end
  end

  protected :tab
end