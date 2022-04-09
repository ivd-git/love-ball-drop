
love.load = function()
  print('Loading')

  local meterInPixels = 100
  love.physics.setMeter(meterInPixels)

  entities = {}
  entities.world = love.physics.newWorld(0, 9.81 * meterInPixels, true)
  entities.ball = {}
  entities.ball.body = love.physics.newBody(entities.world, 400 - 10, 50 - 10, 'dynamic')
  entities.ball.body:setMass(42)
  entities.ball.shape = love.physics.newCircleShape(20)
  entities.ball.fixture = love.physics.newFixture(entities.ball.body, entities.ball.shape)
  entities.ground = {}
  entities.ground.body = love.physics.newBody(entities.world, 0, 590)
  entities.ground.shape = love.physics.newPolygonShape(0,0, 800,0, 800,10, 0,10)
  entities.ground.fixture = love.physics.newFixture(entities.ground.body, entities.ground.shape)

  love.window.setMode(800, 600)
end

love.update = function(dt)
  entities.world:update(dt)
end

love.draw = function()
  ballX, ballY = entities.ball.body:getWorldPoint(entities.ball.shape:getPoint())
  love.graphics.circle('fill', ballX, ballY, entities.ball.shape:getRadius(), 10)
  love.graphics.polygon('line', entities.ground.body:getWorldPoints(entities.ground.shape:getPoints()))
end
