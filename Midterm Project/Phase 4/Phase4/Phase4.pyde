def setup():
    size(1000, 1000)

def drawObject(x, y, s):
    push()
    translate(x, y)
    scale(s)
    noFill()
    rect(0, 0, 80, 80)
    triangle(10, 60, 40, 40, 70, 60)
    triangle(10, 60, 40, 10, 40, 40)
    triangle(40, 10, 40, 40, 70, 60)
    pop()

def draw():
    background(255)
    gridSize = 3

    cellWidth = width / gridSize
    cellHeight = height / gridSize

    minScaleFactor = 0
    maxScaleFactor = min(cellWidth / (84 - gridSize * 0.1), cellHeight / (84 - gridSize * 0.1))
    
    for i in range(gridSize):
        for j in range(gridSize):
            x = i * cellWidth
            y = j * cellHeight

            scaleFactor = max(minScaleFactor, maxScaleFactor)
            drawObject(x, y, scaleFactor)
