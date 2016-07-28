require 'spec_helper'

describe "display_path_to_princess" do

	before :each do
	    @grid_size = 5
		@matrix = [['-', '-', '-', '-', '_'],
		        ['-', '-', '-', '-', '-'],
		        ['-', '-', 'm', '-', '-'],
		        ['-', '-', '-', '-', '-'],
		        ['p', '-', '-', '-', '-']]
	end

	it "takes only odd number for size of grid" do
		is_even_number = @grid_size.odd?
		expect(is_even_number).to eql true
	end

	it "takes only number greater and equal to 3 and less than 100" do
		number = true if @grid_size >= 3 || @grid_size < 100
		expect(number).to eql true
	end

	it "check the position of bot, it should be in center of grid" do
		bot_position = get_princess_position(@matrix)
		expect(bot_position).not_to be_empty
	end

	it "check the postion of pricess, it should be inside grid" do
		princess_position = get_princess_position(@matrix)
		expect(princess_position).not_to be_empty
	end

	it "check bot reaching to princess" do
		bot_x, bot_y = bot_position(@matrix)
		princess_x, princess_y = get_princess_position(@matrix)
		bot_reached_to_princess = bot_getting_princess(bot_x, bot_y, princess_x, princess_y)
		expect(bot_reached_to_princess).to eql true
	end
end