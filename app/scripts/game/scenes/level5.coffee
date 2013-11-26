Q = Game.Q

Q.scene "level5", (stage) ->

  # bg image
  # stage.insert new Q.Background()

  # main map with collision
  Game.map = map = new Q.TileLayer
    type: Game.SPRITE_TILES
    layerIndex: 0
    dataAsset: Game.assets.level5.dataAsset
    sheet: Game.assets.map.sheetName
    tileW: Game.assets.map.tileSize
    tileH: Game.assets.map.tileSize
    z: 2

  stage.collisionLayer map

  # decorations
  background = new Q.TileLayer
    layerIndex: 1,
    type: Game.SPRITE_NONE
    dataAsset: Game.assets.level5.dataAsset
    sheet: Game.assets.map.sheetName
    tileW: Game.assets.map.tileSize
    tileH: Game.assets.map.tileSize
    z: 1

  stage.insert background

  # player
  Game.player = player = stage.insert new Q.Player(Q.tilePos(49.5, 21))

  # camera
  stage.add("viewport")
  Game.setCameraTo(stage, player)

  # enemies by columns
  enemies = [
    ["Zombie", Q.tilePos(17, 15)]
    ["Zombie", Q.tilePos(16, 27, {startLeft: true})]

    ["Zombie", Q.tilePos(27, 20)]

    ["Zombie", Q.tilePos(38, 9)]
    ["Zombie", Q.tilePos(39, 15, {startLeft: true})]
    ["Zombie", Q.tilePos(39, 27)]
    ["Zombie", Q.tilePos(39, 33, {startLeft: true})]

    ["Zombie", Q.tilePos(50, 15)]
    ["Zombie", Q.tilePos(49, 27, {startLeft: true})]

    ["Zombie", Q.tilePos(61, 9)]
    ["Zombie", Q.tilePos(60, 15, {startLeft: true})]
    ["Zombie", Q.tilePos(60, 27)]
    ["Zombie", Q.tilePos(60, 33, {startLeft: true})]

    ["Zombie", Q.tilePos(72, 21)]

    ["Zombie", Q.tilePos(82, 15, {startLeft: true})]
    ["Zombie", Q.tilePos(81, 27)]
  ]

  stage.loadAssets(enemies)


  # items
  doorKeyPositions = [
    door: Q.tilePos(50, 2.65)
    sign: Q.tilePos(48, 3)
    key: Q.tilePos(49.5, 38.8)
    heart1: Q.tilePos(5, 20.9)
    heart2: Q.tilePos(94, 20.9)
  ,
    door: Q.tilePos(49, 38.65)
    sign: Q.tilePos(51, 39)
    key: Q.tilePos(49.5, 2.8)
    heart1: Q.tilePos(5, 20.9)
    heart2: Q.tilePos(94, 20.9)
  ,
    door: Q.tilePos(4, 20.65)
    sign: Q.tilePos(6, 21)
    key: Q.tilePos(94, 20.8)
    heart1: Q.tilePos(49.5, 38.9)
    heart2: Q.tilePos(49.5, 2.9)
  ,
    door: Q.tilePos(95, 20.65)
    sign: Q.tilePos(93, 21)
    key: Q.tilePos(5, 20.8)
    heart1: Q.tilePos(49.5, 38.9)
    heart2: Q.tilePos(49.5, 2.9)
  ]

  bullets = 18
  gunPositions = [
    Q.tilePos(38, 15, {bullets: bullets})
    Q.tilePos(62, 15, {bullets: bullets})
    Q.tilePos(37, 27, {bullets: bullets})
    Q.tilePos(62, 27, {bullets: bullets})
  ]

  random = Math.floor(Math.random() * 4)

  items = [
    ["Key", doorKeyPositions[random].key]
    ["Door", doorKeyPositions[random].door]
    ["ExitSign", doorKeyPositions[random].sign]
    ["Gun", gunPositions[random]]
    ["Heart", doorKeyPositions[random].heart1]
    ["Heart", doorKeyPositions[random].heart2]

    ["Heart", Q.tilePos(4.5, 5.9)]
    ["Heart", Q.tilePos(7.5, 38.9)]
    ["Heart", Q.tilePos(94.5, 6.9)]
    ["Heart", Q.tilePos(92.5, 36.9)]
  ]

  stage.loadAssets(items)

  # store level data for level summary
  Game.currentLevelData.health.available = stage.lists.Heart.length
  Game.currentLevelData.zombies.available = stage.lists.Zombie.length