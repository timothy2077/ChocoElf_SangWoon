import 'package:flutter/material.dart';                        //기본 패키지 불러오기

void main() => runApp(MyApp());                                //main함수로 진입점 표시, MyApp 구동


class MyApp extends StatefulWidget {               //MyApp을 StatefulWidget 상속받아 만들고 state객체 생성
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {                        //State 객체 정의
  @override
  Widget build(BuildContext context) {                         //Build함수 실행
    return MaterialApp(
        home: Scaffold(
             //앱의 상단 바
            appBar: AppBar(
              leading: Icon(Icons.catching_pokemon, size: 50), //좌측 아이콘(leading구역) 설정
              backgroundColor: Colors.blue,                    //배경색: 파란색으로 설정
              title: Center(child: Text('플러터 앱 만들기')),    //중앙정렬로 제목입력
            ),

            //본문
            body: Column(                                    //두 객체를 column에 넣어서 구성
              children: [
                Expanded(                                    //여백이 없도록 화면전체로 구역확장
                    child: Center(                           //중앙배치
                        child: ElevatedButton(                     //ElevatedButton 객체 생성
                            child: Text("Text"),
                            onPressed: () {
                                print("버튼이 눌렸습니다. ");            //버튼을 눌렀을때 실행할 action 정의
                    },
                  ),
                )),
                Stack(                                      //Stack 객체 생성
                  children: [
                    Container(                              //container1,크기 300의 정사각형
                      margin: EdgeInsets.only(bottom: 40),  //하단에서 40 pixel 띄우기
                      alignment: Alignment(0, 0),           //가운데 정렬
                      width: 300,                           //가로크기
                      height: 300,                          //세로크기
                      color: Colors.grey,
                    ),
                    Container(                             //container2. 크기 240
                      width: 240,
                      height: 240,
                      color: Colors.red,
                    ),
                    Container(                             //container3. 크기 180
                      width: 180,
                      height: 180,
                      color: Colors.purple,
                    ),
                    Container(                             //container4. 크기 120
                      width: 120,
                      height: 120,
                      color: Colors.yellow,
                    ),
                    Container(                             //container5. 크기 60
                      width: 60,
                      height: 60,
                      color: Colors.green,
                    ),
                  ],
                )
              ],
            )));
  }
}

'''
 회고

 임상운: 일단 책의 내용들을 활용 할 수 있어서 좋았고 난이도가 너무 높지 않아서 좋았다. 유진님과 번갈아 가면서 작성을 잘 하였고 주석도 유진님이 잘
 달아 주셨다. 아쉬웠던점은 시간이 많이 남았다는 것이다. 훗... ㅋㅋ 하지만 빠르게 완성 할 수 있어서 여유로운 마음으로 회고도 작성하고 좋았다.
 퀘스트들이 이번만 같아 줬으면 좋겠다는 생각이 들었다. ㅎㅎ

 이유진: 책의 내용을 다 기억은 못하더라도 어디에 있었지! 정도는 파악할 수 있어져서 책을 뒤적거리면서 이렇게 하면 될것같아요!를 상운님과 번갈아가면서 반복하다보니 코드가 금새 완성되었다.
 팀워크가 매우 좋았던 느낌적인 느낌?! 그리고 오히려 틀이 정해져있는 코드를 가져다가 잘 이어붙이면 돼서 지난번 Dart 언어 퀘스트보다 더 수월했던 것 같다.
 진짜 뭐라도 만들 수 있다! 에 한발짝 더 다가간 느낌이다.
 상운님이 알려주신 Expanded 개념이 너무 유용해서 한번 다시 공부해봐야겠다.

'''


/*
리뷰어: 김동규

- 1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?
    - 아이콘, 텍스트 버튼 클릭 시 이벤트, 컨테이너 중첩 등 퀘스트 요구사항을 모두 만족했습니다.
    
- 2. 핵심적이거나 복잡하고 이해하기 어려운 부분에 작성된 설명을 보고 해당 코드가 잘 이해되었나요?
    - 컨테이너를 중첩하는 부분이 아무것도 모르는 제가 봐도 이해가 잘 되었습니다. 특히 픽셀 단위로 간격을 줄 수 있는 것도 처음 알았습니다.
        
- 3. 에러가 난 부분을 디버깅하여 “문제를 해결한 기”을 남겼나요? 또는
    - 2에서 언급했다시피 저희조는 좌측 상단을 (0,0) 원점으로 하여 컨테이너를 배치하였는데요 상운님은 첫번째 컨테이너 바닥을 기준으로 또
픽셀을 단위로 간격을 준 것을 보고 하나 배웠습니다.
        
- 4. 회고를 잘 작성했나요?**
    - 아주 여유롭게 작성하신 것 같아서 부럽습니다. 두 분이서 세부 과업을 잘 맡으시고 또 잘 겹합한 것 같습니다. 

- 5. 코드가 간결하고 효율적인가요?
    - 주석과 코드가 일대일로 잘 대응합니다.

*/