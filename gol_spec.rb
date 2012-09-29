describe "Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
	x = 4
	y = 4
	cell=Cell.new(x,y)
	lonely = Cell.new(44,44)
	cell_neighbour=Cell.new(x+1,y)
	cell_array=[cell,cell_neighbour,lonely]

	gof = Gof.new cell_array
	gof.play

	cell_array.should_be empty
end 