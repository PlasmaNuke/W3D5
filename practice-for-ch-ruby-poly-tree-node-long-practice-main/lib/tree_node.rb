require "byebug"
class PolyTreeNode

    attr_reader :value, :parent, :children
    attr_writer :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

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

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "not a child" if !children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if value == target_value
        children.each do |child|
            search_info = child.dfs(target_value)
            return search_info if !search_info.nil?
        end
        nil
    end

    def bfs(target_value)
        return self if value == target_value

        queue = [self]
        children.each do |child|
            queue.push(child)
        end


    end
  
end