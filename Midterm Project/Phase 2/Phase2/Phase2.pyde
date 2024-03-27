def setup():
    size(100, 100)

def draw():
    background(255)
    noFill()
    rect(10, 10, 80, 80)
    triangle(20, 70, 50, 50, 80, 70)
    triangle(20, 70, 50, 20, 50, 50)
    triangle(50, 20, 50, 50, 80, 70)
