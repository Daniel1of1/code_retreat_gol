describe "Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
	x = 4
	y = 4
	cell=Cell.new(x,y)
	lonely = Cell.new(44,44)
	cell_neighbour=Cell.new(x+1,y)
	cell_array=[cell,cell_neighbour,lonely]

	gol = Gol.new cell_array
	gol.play

	cell_array.should_be empty
end

class Cell
 	def initialize(x,y)
 		@x=x
 		@y=y
 	end 	
end 


class Gol
	def initialize(cell_array)
		@cell_array=cell_array
	end

	def play
		should_die=[]
		cell_array.each do |current_cell|
			neighbour_count = 0
			cell_array.each do |other_cells|
				if other_cells != current_cell && (other_cells.x-current_cell.x).abs<=1 && (other_cells.y-current_cell.y).abs<=1 neighbour_count += 1
			end
			if neighbour_count < 2 should_die << current_cell
		end
	cell_array-=should_die
	end



