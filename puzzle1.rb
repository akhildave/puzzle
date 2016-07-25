def displayPathtoPrincess(n, grid)
  raise "Number should be an odd number" if n.even?
  raise "Number should be greater and equal to 3 and less than to 100"  if n < 3 || n > 100

  b_x = b_y = get_bot_position(n, grid)
  p_x, p_y = get_princess_corner(n, grid)

  bot_moving_towards_princess(b_x, b_y, p_x, p_y)   	
end

def get_bot_position(n, grid)
  center_position = n/2
  raise "Position of bot is not in center" unless grid[center_position][center_position] == 'm'
  return center_position 
end

#princess postion by cordinates X-axis and Y-axis
def get_princess_corner(n, grid)
  return 0, 0     if grid[0][0] == 'p'
  return 0, n-1   if grid[0][n-1] == 'p' 
  return n-1, 0   if grid[n-1][0] == 'p' 
  return n-1, n-1 if grid[n-1][n-1] == 'p'
  raise "Oops bot not able to find princess in corners"
end

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

n = 5
grid = [['-','-','-','-','_'],['-','-','-','-','-'],['-','-','m','-','-'],['-','-','-','-','-'],['p','-','-','-','-']]

displayPathtoPrincess(5, grid)
