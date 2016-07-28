require 'spec_helper'

describe "display_path_to_princess" do

	before :each do
	    @size_grid = 5
		@grid = [['-', '-', '-', '-', '_'],
		        ['-', '-', '-', '-', '-'],
		        ['-', '-', 'm', '-', '-'],
		        ['-', '-', '-', '-', '-'],
		        ['p', '-', '-', '-', '-']]
	end

	it "takes only odd number for size of grid" do
		is_even_number = @size_grid.odd?
		expect(is_even_number).to eql true
	end

	it "takes only number greater and equal to 3 and less than 100" do
		number = true if @size_grid >= 3 || @size_grid < 100
		expect(number).to eql true
	end

	it "check the position of bot, it should be in center of grid" do
		center_of_grid = @size_grid / 2
		expect(@grid[center_of_grid][center_of_grid]).to eql "m"
		expect(@grid[center_of_grid][center_of_grid]).not_to be_empty
	end

	it "check the postion of pricess, it should be in corners of grid" do
		corners = []
		corners << [0, 0]
		corners << [0, @size_grid - 1]
		corners << [@size_grid - 1, 0]
		corners << [@size_grid - 1, @size_grid -1]
		princess_position = get_princess_corner(@size_grid, @grid)
		expect(corners).to include(princess_position)
	end

	it "check bot reaching to princess" do
		bot_x = bot_y = get_bot_position(@size_grid, @grid)
		princess_x, princess_y = get_princess_corner(@size_grid, @grid)
		bot_reached_to_princess = bot_moving_towards_princess(bot_x, bot_y, princess_x, princess_y)
		expect(bot_reached_to_princess).to eql true
	end
end