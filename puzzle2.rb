def display_path_to_princess(size_grid, grid)
  raise 'Number should be an odd number' if size_grid.even?
  raise 'Number should be between (3 >= n < 100)' if size_grid < 3 || size_grid > 100

  bot_x, bot_y = bot_position(grid)
  princess_x, princess_y = get_princess_position(grid)
  bot_getting_princess(bot_x, bot_y, princess_x, princess_y)
end

# bot postion by cordinates X-axis and Y-axis
def bot_position(grid)
  grid.each_index do |x|
    @row = x
    @column = grid[x].index 'm'
    break unless @column.nil?
  end
  raise 'Position of bot not found' if @column.nil?
  return @row, @column
end

# princess postion by cordinates X-axis and Y-axis
def get_princess_position(grid)
  grid.each_index do |x|
    @row = x
    @column = grid[x].index 'p'
    break unless @column.nil?
  end
  raise 'Position of princess not found' if @column.nil?
  return @row, @column
end

# moving towards princess and recursive call
def bot_getting_princess(bot_x, bot_y, princess_x, princess_y)
  return true if bot_x == princess_x && bot_y == princess_y
  if bot_y < princess_y
    puts 'Right'
    bot_y += 1
  elsif bot_y > princess_y
    puts 'LEFT'
    bot_y -= 1
  elsif bot_x < princess_x
    puts 'DOWN'
    bot_x += 1
  elsif bot_x > princess_x
    puts 'UP'
    bot_x -= 1
  end
  bot_getting_princess(bot_x, bot_y, princess_x, princess_y)
end

# m denote bot and p denote princess inside grid
n = 5
grid = [['-', '-', '-', '-', '_'],
        ['-', 'm', '-', '-', '-'],
        ['-', '-', '-', '-', '-'],
        ['-', '-', '-', '-', '-'],
        ['_', '-', '-', 'p', '-']]

display_path_to_princess(n, grid)
