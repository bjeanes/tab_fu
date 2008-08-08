module TabFu
  module HelperMethods
    def self.included(mod)
      mod.module_eval do
        def tabs(id = '__default', &proc)
          id = id.nil? ? '' : " id=\"#{id}\""
          concat("<ul#{id}>", proc.binding)
          yield(Tab.new(self, id))
          concat('</ul>', proc.binding)
        end

        def tab(*args)
          controller.send(:tab, *args)
        end
      end
    end
  end
end