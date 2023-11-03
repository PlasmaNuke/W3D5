require "byebug"
class PolyTreeNode

    attr_reader :value, :parent, :children
    attr_writer :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    # def parent=(node)
    #     # if node != nil
    #     #     unless !parent
    #     #         parent.children.each_with_index do |child, i|
    #     #             parent.children = parent.children[0...i] + parent.children[i + 1..-1] if child == self
    #     #         end
    #     #     end
    #     #     @parent = node
    #     #     unless parent.children.include?(self)
    #     #         parent.children << self
    #     #     end
    #     # else
    #     #     nil
    #     # end
    # end
    # def parent=(node)
    #     if node != nil
    #         old_parent = self.parent
    #         new_parent = node
    #         if !new_parent.children.include?(self)
    #             new_parent.children << self
    #         end
    #         @parent = node
    #         if old_parent != nil
    #             old_parent.children.each_with_index do |child, i|
    #                 old_parent.children = old_parent.children[0...i] + old_parent.children[i + 1..-1] if child == self
    #             end
    #         end
    #     else
    #         @parent = nil
    #     end


    # end
    def parent=(node)
        #remove self from old_parents' children but only if old parent is NOT nil
        old_parent = @parent
        if !old_parent.nil?
            old_parent.children = old_parent.children.reject{|child| self == child}
        end
        #add self to new_parents' children but only if new parent is NOT nil
        new_parent = node
        if !new_parent.nil? && !new_parent.children.include?(self)
            new_parent.children << self
        end
        #set self's parent to given node
        @parent = node


    end

    def add_child
        
    end
  
end