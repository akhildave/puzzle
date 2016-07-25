def displayPathtoPrincess(n, grid)
  raise "Number should be an odd number" if n.even?
  raise "Number should be greater and equal to 3 and less than to 100"  if n < 3 || n > 100

  b_x, b_y = get_bot_position(grid)
  p_x, p_y = get_princess_position(grid)

  bot_moving_towards_princess(b_x, b_y, p_x, p_y)   	
end

#bot postion by cordinates X-axis and Y-axis
def get_bot_position(grid)
  bot = []
  grid.each_index do |g|
    x = grid[g].index 'm'
    bot[0] = g
    bot[1] = x
    break if !x.nil?
  end
  raise "Position of bot not found" if bot.empty?
  return bot[0], bot[1]
end

#princess postion by cordinates X-axis and Y-axis
def get_princess_position(grid)
  princess = []
  grid.each_index do |g|
    x = grid[g].index 'p'
    princess[0] = g
    princess[1] = x
    break if !x.nil?
  end
  raise "Position of princess not found" if princess.empty?
  return princess[0], princess[1]
end

#moving towards princess
def bot_moving_towards_princess(b_x, b_y, p_x, p_y)
  if b_x == p_x && b_y == p_y
    return
  else
    if b_y < p_y
      puts "Right"
      b_y += 1
    elsif b_y > p_y
      puts "LEFT"
      b_y -= 1
    elsif b_x < p_x
      puts "DOWN"
      b_x += 1
    elsif b_x > p_x
      puts "UP"
      b_x -= 1
    end
    bot_moving_towards_princess(b_x, b_y, p_x, p_y)
  end
end

#m denote bot and p denote princess inside grid
n = 5
grid = [['-','-','-','-','_'],['-','m','-','-','-'],['-','-','-','-','-'],['-','-','-','-','-'],['-','-','-','p','-']]

displayPathtoPrincess(5, grid)
