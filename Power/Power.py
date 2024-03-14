def print_graph(n):
    for i in range(-8, 9):
        print("*" * int(get_power(i, 2)))
def get_power(x, n):
    return x ** n
print_graph(1)