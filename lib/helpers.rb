module TabFu
  module HelperMethods
    def self.included(mod)
      mod.module_eval do
        def tabs(id = '__default', &proc)
          html_id = id.nil? || id == '__default' ? '' : " id=\"#{id}\""
          concat("<ul#{html_id}>", proc.binding)
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