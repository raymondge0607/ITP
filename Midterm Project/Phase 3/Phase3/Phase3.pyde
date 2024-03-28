def setup():
    size(400, 400)
    
def drawObject(x, y, s):
    push()
    translate(x, y)
    scale(s)
    noFill()
    rect(10, 10, 80, 80)
    triangle(20, 70, 50, 50, 80, 70)
    triangle(20, 70, 50, 20, 50, 50)
    triangle(50, 20, 50, 50, 80, 70)
    pop()
    
def draw():
    background(255)
    drawObject(0, 0, 1)
    drawObject(100, 100, 2)
