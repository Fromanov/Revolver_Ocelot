snake = {}
apple = {}
field = {}

function love.load()

  width, height = love.graphics.getDimensions( )

  apple.x = 0 
  apple.y = 0
  apple.exist = false 
  
  field.pixelspercell = 25
  
  snake.x = width/2
  snake.y = height/2
  snake.direction = "left"
  snake.speed = 1
end

function love.update(dt)
  if apple.exist == false then
    apple.x = math.random(0, 29) 
    apple.y = math.random(0, 29)
    apple.exist = true	
  end  
  
  snakeMovement()
  
end 

function snakeMovement()

 if love.keyboard.isDown("up") then 
	if snake.direction == "left" or snake.direction == "right" then
		snake.direction = "up"
	end
  elseif love.keyboard.isDown("down") then 
	if snake.direction == "left" or snake.direction == "right" then
		snake.direction = "down"
	end
  elseif love.keyboard.isDown("left") then 
	if snake.direction == "up" or snake.direction == "down" then
		snake.direction = "left"
	end
  elseif love.keyboard.isDown("right") then 
	if snake.direction == "up" or snake.direction == "down" then
		snake.direction = "right"
	end
  end
  
	if snake.direction == "up" then
		snake.y = snake.y - snake.speed	
	elseif snake.direction == "down" then
		snake.y = snake.y + snake.speed	
	elseif snake.direction == "left" then
		snake.x = snake.x - snake.speed	
	elseif snake.direction == "right" then
		snake.x = snake.x + snake.speed 
	end
end

function love.draw()
  love.graphics.setColor(255, 25, 33)
  love.graphics.rectangle("fill", apple.x * field.pixelspercell, apple.y * field.pixelspercell, field.pixelspercell, field.pixelspercell)
  
  love.graphics.setColor(255, 40,219)
  love.graphics.rectangle("fill", snake.x, snake.y, field.pixelspercell, field.pixelspercell)
  
  love.graphics.setColor(255, 255,255)
  love.graphics.print (snake.x, 10, 10)
  love.graphics.print (snake.y, 10, 20)
end