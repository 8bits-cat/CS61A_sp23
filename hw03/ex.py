def pingpong(n):
    i, x, plus = 1, 1, 1
    while i < n:
        if i % 8 == 0 or num_eights(i):
            plus = -1 * plus
        x = x + plus
        i += 1
    return x
