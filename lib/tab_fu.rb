# TabFu

module TabFu
  def self.included(klass)
    ApplicationHelper.send(:include, TabFu::HelperMethods)
    
    klass.module_eval do      
      # if passing more than one tab, must be explicit with {}
      # these arguments should be merged... somehow...
      def self.tab(name, opts = {}) 
        before_filter(opts) do |c|
          c.send :tab, *name
        end
      end
    end
  end
  
  protected
  def tab(*args)
    @__current_tab ||= {}
    
    options = args.extract_options!
    if args.empty?
      args.each_pair do |list, name|
        @__current_tab[list] = name
      end
    else
      @__current_tab['__default'] = args.first
    end
    nil
  end
end