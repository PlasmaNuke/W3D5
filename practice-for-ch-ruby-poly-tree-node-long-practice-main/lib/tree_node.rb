require "byebug"
class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if node != nil
            unless !parent
                parent.children.each_with_index do |child, i|
                    parent.children = parent.children[0...i] + parent.children[i + 1..-1] if child == self
                end
            end
            @parent = node
            unless parent.children.include?(self)
                parent.children << self
            end
        else
            nil
        end
    end

  
end