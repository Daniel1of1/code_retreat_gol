require 'rspec/expectations'

class Cell
	attr_accessor :x, :y
 	def initialize(x,y)
 		@x=x
 		@y=y
 	end
 	def is_neighbour? other
 		self != other && (other.x-@x).abs<=1 && (other.y-@y).abs<=1
 	end
end 


class Gol
	def initialize(cells)
		@cells=cells
	end

	def play
		should_die=[]
		@cells.each do |current_cell|
			neighbour_count = 0
			@cells.each do |other|
				neighbour_count += 1 if current_cell.is_neighbour? other
			end
			should_die << current_cell if should_die?(neighbour_count)
		end
		@cells-=should_die
		@cells
	end
	private
	def should_die? neighbour_count
		(neighbour_count < 2) || (neighbour_count ==4)
	end
end


describe "Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
	x = 4
	y = 4
	cell=Cell.new(x,y)
	lonely = Cell.new(44,44)
	cell_neighbour=Cell.new(x+1,y)
	cells=[cell,cell_neighbour,lonely]

	gol = Gol.new cells
	cells = gol.play

	it "should be_empty" do
		cells.should be_empty
	end
end	

describe Board do 
	describe "when the cell has 4 neighbours"	do
		x=666
		y=666

		cell = Cell.new(x,y)
		cell_Top=Cell.new(x,y+1)
		cell_Below=Cell.new(x+1,y)
		cell_Left=Cell.new(x-1,y)
		cell_Right=Cell.new(x,y-1)

		cells=[cell,cell_Top,cell_Right,cell_Left,cell_Below]

		gol = Gol.new cells
		cells = gol.play

		it "should_be_empty" do
			cells.include?(cell).should be_false
		end
	end
end

describe Board do
	describe "When an empty grid reference has three neighbours" do

		x=666
		y=666

		cell_Top=Cell.new(x,y+1)
		cell_Below=Cell.new(x+1,y)
		cell_Left=Cell.new(x-1,y)

		cells=[cell_Top,cell_Left,cell_Below]

		gol = Gol.new cells
		cells = gol.play

		it "should_be_go_forth_and_multiply" do
			cells.count == 4
		end
	end
end


