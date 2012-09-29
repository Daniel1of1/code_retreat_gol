require 'rspec/expectations'

class Board
	def initialize(x,y,size,living_cells)
		@x=x
		@y=y
		@size=size
		@living_cells=living_cells
	end
	
	
end

# describe Board do
# 	describe "when initializing" do
# 		let(:living_cells) {[Cell.new(0,0),Cell.new(1,0),Cell.new(4,4)]}
# 		let(:board) {Board.new(0,0,5,living_cells)}
# 		subject {board}
# 		it "should not be empty" do
# 			board.should_not be_empty
# 		end
# 	end
# 	describe "when a cell has less than 2 neighbours" do
# 		let(:living_cells) {[[0,0],[0,1],[4,4]]}
# 		let(:board) {Board.new(5,5,living_cells)}
# 		subject {board}
# 		before {board.next}
# 		it "should be empty" do
# 			board.should be_empty
# 		end
# 	end
# end

		
