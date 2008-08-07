# TabFu

module TabFu
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