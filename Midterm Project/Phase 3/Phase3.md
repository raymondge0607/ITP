# Phase 3 documentation
- For Phase 3, I had directly followed the instructions for this section on the Github repository for the class. I had gone through utilizing the translate and scale functions as well as the push and pop functions to maintain the shape before changing it at all. My code ended up looking like this:

def setup():
    size(400, 400)

def drawObject(x, y, s):
    push()
    translate(x, y)
    scale(s)
    background(255)
    noFill()
    rect(10, 10, 80, 80)
    triangle(20, 70, 50, 50, 80, 70)
    triangle(20, 70, 50, 20, 50, 50)
    triangle(50, 20, 50, 50, 80, 70)
    pop()

def draw():
    drawObject(0, 0, 1)
    drawObject(50, 50, 2)

- However, when I ran this code, I had realized that it would only draw the second shape in the draw function and not the first one. In this instance, I had utilized chatGPT and asked it why this might be occuring and it had indicated that my background color initiating function must be moved to the beginning of the draw function. This made sense to me because if it is in the drawObject function, it is essentially clearing the canvas so by the time the second shape is drawn, the one before it is erased. By putting the background function at the start of the draw function, it creates a blank canvas and then allows you to go about creating however many instances of the shape you want. In the end, my code looked like this:

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
    drawObject(50, 50, 2)
