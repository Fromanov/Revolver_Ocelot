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
  snake.speed = 2
  snake.score = 0
  snake.iterator = 0
end

function love.update(dt)
  if apple.exist == false then
    apple.x = math.random(0, 725) 
    apple.y = math.random(0, 725)
    apple.exist = true	
  end  
  
  snakeMovement()
  applePick()
  
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
	
	if snake.x < 0 then 
		snake.x = 750
	elseif snake.x > 750 then
		snake.x = 0
	end
	if snake.y < 0 then 
		snake.y = 750
	elseif snake.y > 750 then
		snake.y = 0
	end
end

function applePick()
	if snake.x + field.pixelspercell >= apple.x and snake.x + field.pixelspercell <= apple.x + field.pixelspercell or snake.x >= apple.x and snake.x <= apple.x + field.pixelspercell then 
		if snake.y + field.pixelspercell >= apple.y and snake.y + field.pixelspercell <= apple.y + field.pixelspercell or snake.y >= apple.y and snake.y <= apple.y + field.pixelspercell  then 
			snake.score = snake.score + 1
			apple.exist = false
			snake.iterator = snake.iterator + 1
		end
	end	
end

function love.draw()
  love.graphics.setColor(255, 25, 33)
  love.graphics.rectangle("fill", apple.x, apple.y, field.pixelspercell, field.pixelspercell)
  
  love.graphics.setColor(255, 40,219)
  love.graphics.rectangle("fill", snake.x, snake.y, field.pixelspercell, field.pixelspercell)
  
  love.graphics.setColor(255, 255,255)
  love.graphics.print (snake.x, 10, 10)
  love.graphics.print (snake.y, 10, 20)
  love.graphics.print (snake.score, 10, 30)
end