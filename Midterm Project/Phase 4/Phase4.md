# Phase 4 documentation
- For Phase 4 of this project, I wanted to have a gridSize value that would determine the size of the grid and adjust the scaling of the image and cell accordingly to fit in the canvas size. At first, I thought to add a user input gor the gridSize value until I tried it and realized that user input does not  function the way it does in other programs such as visual studio code. Instead I just initiated a gridSize value of 5 in the code and one can adjust the size manually by simply changing the value in the code.

def draw():
    background(255)
    gridSize = 5

- I then wanted to proceed by initiating the cellWidth and cellHeight and this was done by simply dividing he width and height, respectively, of the canvas size by the gridSize value.

    cellWidth = width / gridSize
    cellHeight = height / gridSize

- Following that, I wanted to establish a minimum and maximum scale factor to restrict the sizing of the images so that they do not get too large or too small accordingly to the cell size. I set the minimum scale factor to 0 because I want it so that no matter how big the grid size value is, the images will be able to be small enough to not overlap. The maximum scale factor is what I had quite a big of struggle with. Initially I had written the coordinates of my shape to have a bit of leeway on the grid but to maximize the size of it, I reworked the coordinates so that the edges of the square were touching the cell wall.

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

- I can now get into the writing the nested for loop. I started off writing the following code:

    for i in range(gridSize):
        for j in range(gridSize):
            x = i * cellWidth
              y = j * cellHeight

The first two lines initiate the nested for loop to iterate over each row and column. The following two lines calculate coordinates of the top left corner of the current cell based on the current row index and the height of each grid cell.

- As my shape is more of a "logo" than a symbol and required outlines instead of filled shapes, I believe that to maximize the size of my shape to the edges of it's respective cell would mean that the outline edge would either overlap or disappear. I knew that there had to be a least a little bit of space in between the cells so that the outline would show. Thus, I derived the following code:

              maxScaleFactor = min(cellWidth / (85 - gridSize * 0.1), cellHeight / (85 - gridSize * 0.1))

The scaleFactor is derived by dividng the cell width and cell height by a value that adjusts accordingly to the grid value chosen. After a lot of trial and error, I landed on the equation "85 - gridSize * 0.1". 85 represents a constant that correponds to the padding between shapes within the grid cell that I determined simply by testing different grid size values and the results produced in processing. 0.1 is the derived scaling factor that adjusts the maximum allowable scale based on the gridSize value. multiplying the gridSize value (in this case 0.1) reduces the maximum allowable scale as the gridSize value increases to make sure that the shapes don't become too large. This line determines the appropriate scale factor to use for drawing the object within the current cell. It selects the maximum of the minimum scale factor and the maximum scale factor calculated earlier.

- Finally, the last line of code is to draw the drawObject function to execute the shape.

              drawObject(x, y, scaleFactor)
