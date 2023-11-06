require_relative "tree_node.rb"

class KnightPathFinder
    attr_reader :start_position

    def self.valid_moves(pos)
        x, y = pos

        potential_positions = [
        [x + 2, y + 1], [x + 1, y + 2],
        [x + 2, y - 1], [x - 1, y + 2],
        [x - 2, y + 1], [x + 1, y - 2],
        [x - 2, y - 1], [x - 1, y - 2]
        ]
        potential_positions.select{|pos|pos[0] >= 0 && pos[0] <= 8 && pos[
        1] >= 0 && pos[1] <= 8}
    
    end

    def initialize(position)
        @start_position = position
        @root_node = PolyTreeNode.new(@start_position)
        build_move_tree(start_position)
        @considered_positions = [@start_position]
    end

    def new_move_positions(pos)
       val_moves =  Array.valid_moves(pos).reject{|pos| @considered_positions.include?(pos)}

       @considered_positions.push(val_moves)
       val_moves
    end

    def build_move_tree
        
    end



end