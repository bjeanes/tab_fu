# TabFu

module TabFu
  def self.included(klass)
    RAILS_DEFAULT_LOGGER.debug "TabFu was included"
    ApplicationHelper.send(:include, TabFu::HelperMethods)
    
    klass.module_eval do
      RAILS_DEFAULT_LOGGER.debug "Defining controller `tab` method"
      def self.tab(name, opts = {})
        before_filter(opts) do |c|
          c.instance_variable_set(:@_current_tab, name)
        end
      end
    end
  end
  
  protected
  def tab(name)
    @_current_tab = name
  end
end