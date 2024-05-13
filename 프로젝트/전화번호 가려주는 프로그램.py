numbers = '010-12345-56789'

def change_num(nums):
    answer = nums.replace(nums[-5:], "#####")
    return answer

print (change_num(numbers))
