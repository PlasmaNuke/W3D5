require "byebug"
require_relative "tree_node.rb"

class KnightPathFinder
    attr_reader :start_position, :considered_positions


    def self.valid_moves(pos)
        x, y = pos

        potential_positions = [
        [x + 2, y + 1], [x + 1, y + 2],
        [x + 2, y - 1], [x - 1, y + 2],
        [x - 2, y + 1], [x + 1, y - 2],
        [x - 2, y - 1], [x - 1, y - 2]
        ]
        potential_positions.select{|pos|pos[0] >= 0 && pos[0] < 8 && pos[
        1] >= 0 && pos[1] < 8}
    
    end

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
        build_move_tree
        # self.new_move_positions(position)
    end

    def new_move_positions(pos)
       val_moves = KnightPathFinder.valid_moves(pos).reject { |pos| @considered_positions.include? (pos) }

       @considered_positions += val_moves
       val_moves
    end

    def build_move_tree
        queue = [@root_node]

        # debugger

        until queue.empty?

            current_node = queue.shift

            new_move_positions(current_node.value).each do |pos|
                new_move = PolyTreeNode.new(pos)
                current_node.add_child(new_move)
                queue.push(new_move)
            end
        end
    end

    def trace_path_back(pos)
        current = pos
        path = []

        while current != @root_node
            path << current.value
            current = current.parent
        end
        path << @root_node.value
        path.reverse

    end

    def find_path(end_pos)
        end_node =  @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end



end