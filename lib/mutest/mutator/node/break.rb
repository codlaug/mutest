module Mutest
  class Mutator
    class Node
      # Mutator for loop control keywords
      class Break < Generic
        handle(:break)

        private

        # Emit mutations
        #
        # @return [undefined]
        def dispatch
          super()
          emit_singletons
          children.each_index(&method(:delete_child))
        end
      end
    end
  end
end
