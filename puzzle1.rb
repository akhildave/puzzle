def display_path_to_princess(size_grid, grid)
  raise 'Number should be an odd number' if size_grid.even?
  raise 'Number should be between (3 >= n < 100)' if size_grid < 3 || size_grid > 100

  bot_x = bot_y = get_bot_position(size_grid, grid)
  princess_x, princess_y = get_princess_corner(size_grid, grid)
  p bot_moving_towards_princess(bot_x, bot_y, princess_x, princess_y)
end

# bot postion by cordinates X-axis and Y-axis
def get_bot_position(size_grid, grid)
  center = size_grid / 2
  raise 'Position of bot is not in center' unless grid[center][center] == 'm'
  center
end

# princess postion by cordinates X-axis and Y-axis
def get_princess_corner(size_grid, grid)
  return 0, 0 if grid[0][0] == 'p'
  return 0, size_grid - 1 if grid[0][size_grid - 1] == 'p'
  return size_grid - 1, 0 if grid[size_grid - 1][0] == 'p'
  return size_grid - 1, size_grid - 1 if grid[size_grid - 1][size_grid - 1] == 'p'
  raise 'Oops bot not able to find princess in corners'
end

# moving towards princess and recursive call
def bot_moving_towards_princess(bot_x, bot_y, princess_x, princess_y)
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
  bot_moving_towards_princess(bot_x, bot_y, princess_x, princess_y)
end

# m denote bot and p denote princess inside grid
size_grid = 5
grid = [['-', '-', '-', '-', '_'],
        ['-', '-', '-', '-', '-'],
        ['-', '-', 'm', '-', '-'],
        ['-', '-', '-', '-', '-'],
        ['p', '-', '-', '-', '-']]

display_path_to_princess(size_grid, grid)
