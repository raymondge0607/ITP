def setup():
    size(800, 800)
    
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
    gridSize = 20

    cellWidth = width / gridSize
    cellHeight = height / gridSize

    for i in range(gridSize):
        for j in range(gridSize):
            x = i * cellWidth
            y = j * cellHeight

            scaleFactor = min(cellWidth / (90 - gridSize * 0.2), cellHeight / (90 - gridSize * 0.2))
            drawObject(x, y, scaleFactor)
            
    
