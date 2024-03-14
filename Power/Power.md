# Power Documentation
- The goal of this code is to write a program that prints our the graph of y=x^2 horizontally.
- First I started with the print_graph function and utilized a loop to iterate over the range (-8,9). For each i in the range a string of asterisks is printed. The length of each string is determined by the power of i squared
- Inside this loop, the value of i raised to the power of 2 is calculated using the "get_power" function and converts it to an integer and multiplies the string "*" by that value. Finally, the resulted string is printed so that for each i value in the loop, a line of asterisks is printed to which the length corresponds to the value of i^2.
- I then defined the get_power(x, n) function to calculate x to the power of n.
- Lastly, I included the function print_graph(1) which means the graph of the function y = x^2 will be printed where n is set to 1.
