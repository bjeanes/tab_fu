# TabFu

module TabFu
  def self.included(klass)
    ApplicationHelper.send(:include, TabFu::HelperMethods)
    
    klass.module_eval do      
      # if passing more than one tab, must be explicit with {}
      # these arguments should be merged... somehow...
      def self.tab(name, opts={}, *filter_opts) 
        before_filter(*filter_opts) do |c|
          c.send :tab, *[name, opts]
        end
      end
    end
  end
  
  protected
  def tab(*args)
    @__current_tab ||= {}
    
    options = args.extract_options!
    unless args.empty?
      @__current_tab['__default'] = args.first
    end
    
    options.each_pair do |list, name|
      @__current_tab[list.to_s] = name
    end
  end
end