# 단어를 입력받습니다.
word = input("단어를 입력 하세요. ")

#단어가 맞는지 확인 할 변수 선언
isPalindrome = True

# 리스트로 변환
myList = list(word)
emptyList = []

# 문장 뒤집기
for i in myList:        # 리스트
  emptyList.insert(-len(emptyList), i)
  print(-len(emptyList), i)
  print(emptyList)

'''if word ==  str(emptyList):
  print("회문 입니다.")
else:
  print("회문이 아닙니다.")'''

# print(word == '우영우')
# print(emptyList)

# word[0] 과   word[-1-0] 비교 ->   ex  A,B,C,D,A   ->   word[0] = A,      word[-1] = A
# i = 0, 1, 2         5 / 2    2       .5
'''
회문이란? 앞에서부터 읽어도 같고, 뒤에서부터 읽어도 같은 단어, 구, 문장, 숫자 혹은 문단인
* 인덱스 i : 입력받은 word의 인덱스 및 for문의 반복횟수를 나타내는 변수
* range(len(word) // 2) : 회문 판별에서, 판별하고자 하는 문자열의 가장 앞, 뒤에서부터 한 글자씩 비교를 하므로,
                          모든 인덱스에 대해 반복하지 않고 문자열의 가운데를 기준으로 나눕니다.
'''
for i in range (len(word) // 2):
    print(i)
    if word[i] != word[-1-i]:         # 문자열의 가장 앞 글자와 맨 뒤 글자가 같은지 비교합니다.
        isPalindrome = False
        break
# r a d a r
# l e v e l

# 리스트로 된 문장을 다시 string으로 변환
# result = ''.join(map(str, emptyList))
result = ''
for i in emptyList:
  result += i

print("뒤집힌 단어는 :", result)

if (isPalindrome):
  print("입력된 단어는 회문입니다.")
else:
  print("입력된 단어는 회문이 아닙니다.")

''' 회고
 임상운: 저는 일단 처음에 제가 생각한 방식이 안되어서 좀 당황 했습니다. 그런데
        준오님이 해결책을 가져오셔서 그 방법대로 하니까 작동이 되서 제가 생각
        한 방식과 다른 방식을 배운 것 같습니다. 설명까지 직접 자세히 들으니 문제
        를 해결하는데는 다양한 방식이 있다는 것을 알았습니다.

 이준오 : 처음에 생각이 잘 떠오르지 않아서 조금 막막했는데, 상운님과 의견을 나누고
          공유하면서 막힌 부분을 해결할 수 있었습니다. 혼자서 할 때는 생각을 전환하기
          쉽지 않은데 대화하면서 코드리뷰를 하니 아이디어를 떠올리기 좀 더 수월했던 것 같습니다.
'''
