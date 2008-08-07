# Include hook code here

require 'lib/tab_fu'

class TabFu
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


# OTHER CODE TO SORT OUT (none of this works until this is setup to automatically include into various controllers and modules...)

# ApplicationHelper
def tabs(id = nil, &proc)
  id = id.nil? ? '' : " id=\"#{id}\""
  concat("<ul#{id}>", proc.binding)
  yield(Tab.new(self, id))
  concat('</ul>', proc.binding)
end

# ApplicationController
def self.tab(name, opts = {})
  before_filter(opts) do |c|
    c.instance_variable_set(:@current_tab, name)
  end
end

def tab(name)
  @current_tab = name
end

protected :tab