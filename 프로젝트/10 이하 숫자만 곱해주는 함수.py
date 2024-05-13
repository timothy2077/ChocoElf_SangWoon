def mul(*values):
    output = 1
    for num in values:
        if num <= 10:
            output *= num
        else:
            pass
    return output

print (mul(2,3,4,5))
