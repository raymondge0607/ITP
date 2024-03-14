stacks = int(input("how tall (1-8) should this pyramid be?"))
if stacks < 1 or stacks > 8:
    print("thats not between 1 and 8 :(")
    exit()
elif stacks >= 1 and stacks <= 8:
    for i in range(1, stacks + 1):
        print(" " * (stacks - i) + "#" * i)