# Phase 2 Documentation
- Going into processing now, I wanted to create outlined shapes and not shapes that are filled in. I started by creating my 100 x 100 graph by typing the following code:

def setup():
    size(100, 100)

- I then began the draw function by starting off with a white background using "background(255)", indicating "noFill()" so that the shapes drawn would not fill in, then creating the first square outline by writing, " rect(10, 10, 80, 80)". I then wanted to create the first triangle (center bottom) our of three by writing "triangle(20, 30, 50, 50, 80, 30)". I tested out my code to see if all was going smoothly and it turns out that my triangle and subsequently my entire drawing was upside down. In this situation, I utilized chatGPT and asked it why my drawing might be upside down and it responded that the coordinate system in processing begins at the top left and not the bottom left as most conventional graphs do. As a result, I redrew the triangle section of my sketch upside down and entered the coordinates using the new orientation. This was the code that ended up drawing the shape in the correct orientation:

triangle(20, 70, 50, 50, 80, 70)
triangle(20, 70, 50, 20, 50, 50)
triangle(50, 20, 50, 50, 80, 70)

 
