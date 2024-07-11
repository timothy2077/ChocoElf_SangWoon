```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one': (context) => const OneScreen(),
        '/two': (context) => const TwoScreen(),
        '/three': (context) => const ThreeScreen(),
      },
    );
  }
}

class OneScreen extends StatelessWidget {

  const OneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(bottomNavigationBarTheme:  const BottomNavigationBarThemeData(backgroundColor: Colors.black)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: 80,
          title: const Center(child: Text('Munpia', style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),)),
          leading: Row(
            children: [
              const Icon(Icons.menu, size: 30, color: Colors.white,),
              Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_none, size: 30, color: Colors.white,),
                      onPressed: () {
                        // 아이콘을 눌렀을 때 할 일
                      },
                    ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        )
                      )
                    )
                  ],
                ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.g_mobiledata, size: 35, color: Colors.white,),
              onPressed: () {
                // 첫 번째 오른쪽 아이콘(검색)을 눌렀을 때 할 일
              },
            ),
            IconButton(
              icon: const Icon(Icons.redeem, color: Colors.white,),
              onPressed: () {
                // 두 번째 오른쪽 아이콘(알림)을 눌렀을 때 할 일
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white,),
              onPressed: () {
                // 세 번째 오른쪽 아이콘(설정)을 눌렀을 때 할 일
              },
            ),
          ],
        ),
        body: ListView(
            children: [
              Container(
                color: Colors.amber,
                height: 200,
                child: const Center(child: Text("광고 작품, 신작 소개")),
              ),
              SizedBox(
                height: 50,
                child:
                ListView.builder(
                  scrollDirection: Axis.horizontal, // 가로 스크롤 방향 설정
                  itemCount: 20, // 아이템 개수 설정
                  itemBuilder: (context, index) {
                  return Container(
                    width: 75, // 각 아이템의 너비 설정
                    margin: const EdgeInsets.all(8),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
                },
              ),),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("최초 공개 무료 베스트", style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("선독적 유료 베스트", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("화제작", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("10 + 1", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("믿고보는 추천작", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("지금 무료", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("유료 신작", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("작품 추천", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("완결 정주행", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("다운로드 이북", style: TextStyle(color: Colors.white, fontSize: 20))),
              ), 
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("실시간 랭킹", style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                height: 200,
                child: const Center(child: Text("문피아 추천 태그", style: TextStyle(color: Colors.white, fontSize: 20))),
              ),   
            ],
          ),
        bottomNavigationBar: 
        Theme(data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: 
          BottomNavigationBar(
          
          onTap: (index) {

            if (index == 3) {
              Navigator.pushReplacementNamed(context, '/two');
            } 

            if (index == 4) {
              Navigator.pushReplacementNamed(context, '/three');
            }
            // 탭이 선택되었을 때 처리할 로직
            // setState 등을 사용하여 화면을 업데이트할 수 있습니다.
          },
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chevron_left),
              label: '이전',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.refresh),
              label: '새로고침',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: '내다운로드',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: '선호작',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정',
            ),
          ],
        ),)
      )
    );
  }
}

class TwoScreen extends StatelessWidget {

  const TwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.chevron_left, color: Colors.white,),
        title: const Text("내 다운로드", style: TextStyle(color:  Colors.white,)),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, size: 35, color: Colors.white,),
            onPressed: () {
            // 첫 번째 오른쪽 아이콘(검색)을 눌렀을 때 할 일
            },
          ),
        ]
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Text("전체"),
              Icon(Icons.keyboard_arrow_down),
              Text("읽은 순"),
              Icon(Icons.keyboard_arrow_down),
              Spacer(),
              Icon(Icons.download, color: Colors.blue,),
              Text("이북 구매", style: TextStyle(color: Colors.blue),),
              Icon(Icons.chevron_right, color: Colors.blue,)
            ],
          ),
          Expanded(child: SizedBox(
            child:
              ListView.builder(
                  itemCount: 20, // 아이템 개수 설정
                  itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.all(8),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
                },
          )),
      )],
      ),
      bottomNavigationBar: 
        Theme(data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: 
          BottomNavigationBar(
          
          onTap: (index) {

            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/one');
            } 

            if (index == 4){
              Navigator.pushReplacementNamed(context, '/three');
            }
            // 탭이 선택되었을 때 처리할 로직
            // setState 등을 사용하여 화면을 업데이트할 수 있습니다.
          },
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chevron_left),
              label: '이전',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.refresh),
              label: '새로고침',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: '내다운로드',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: '선호작',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정',
            ),
          ],
        ),)
      

    );
  }
}

class ThreeScreen extends StatelessWidget {
  const ThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: const Icon(Icons.chevron_left, color: Colors.white,),
          title: const Text("선호작", style: TextStyle(color:  Colors.white,)),
          actions: [
            IconButton(
            icon: const Icon(Icons.home_filled, size: 30, color: Colors.white,),
            onPressed: () {
            // 첫 번째 오른쪽 아이콘(검색)을 눌렀을 때 할 일
            },
          ),
            IconButton(
              icon: const Icon(Icons.notifications_none, size: 30, color: Colors.white,),
                onPressed: () {

            },
          ),
            IconButton(
              icon: const Icon(Icons.search, size: 30, color: Colors.white,),
                onPressed: () {

            },
          ),

        ]
        ),
        body: Column(
        children: [
          Container(
                color: Colors.amber,
                height: 200,
                child: const Center(child: Text("광고 작품, 신작 소개")),
              ),
          Row(
            children: [
              const Text("새글순"),
              const Icon(Icons.keyboard_arrow_down),
              const Text("전체"),
              const Icon(Icons.keyboard_arrow_down),
              const Spacer(),
              const Text("다크 모드", style: TextStyle(color: Colors.blue),),
              const SwitchExample(),
              Container(
                width: 40,
                height: 40,
                color: Colors.grey,
                child: const Center(child: Text("설정")),
              )
            ],
          ),
          Container(
              alignment: Alignment.centerLeft,
              height: 40,
              color: Colors.grey,
              child:const Text("미분류(95)"),
            ),
          Expanded(child: SizedBox(
            child:
              ListView.builder(
                  itemCount: 20, // 아이템 개수 설정
                  itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.all(8),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
                },
          )),
      )
        ],
      ),
      bottomNavigationBar: 
        Theme(data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: 
          BottomNavigationBar(
          
          onTap: (index) {

            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/one');
            } 

            if (index == 3){
              Navigator.pushReplacementNamed(context, '/two');
            }
            // 탭이 선택되었을 때 처리할 로직
            // setState 등을 사용하여 화면을 업데이트할 수 있습니다.
          },
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chevron_left),
              label: '이전',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.refresh),
              label: '새로고침',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: '내다운로드',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: '선호작',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정',
            ),
          ],
        ),)
      
      )
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  SwitchExampleState createState() => SwitchExampleState();
}

class SwitchExampleState extends State<SwitchExample> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: switchValue,
      onChanged: (value) {
        setState(() {
          switchValue = value;
        });
      },
      activeColor: Colors.blue, // 스위치가 켜진 상태의 색상
      activeTrackColor: Colors.lightBlueAccent, // 스위치가 켜진 상태의 트랙 색상
      inactiveThumbColor: Colors.grey, // 스위치가 꺼진 상태의 톱니 모양의 색상
      inactiveTrackColor: Colors.grey[300], // 스위치가 꺼진 상태의 트랙 색상
      // activeThumbImage: AssetImage('assets/images/switch_on.png'), // 스위치가 켜진 상태의 이미지
      // inactiveThumbImage: AssetImage('assets/images/switch_off.png'), // 스위치가 꺼진 상태의 이미지
    );
  }
}
```
구조
![image](https://github.com/chocoelf/aiffel_quest/assets/168162744/1c25e39f-ee7c-4e41-9e31-ca30545dc182)

와이어 프레임
![image](https://github.com/chocoelf/aiffel_quest/assets/168162744/79c67ecd-4287-46a5-91e7-3e066237e426)

프로토 타입
![gifmaker_me](https://github.com/chocoelf/aiffel_quest/assets/168162744/ee42e6ae-c511-4344-9be4-5fc82814f32a)

영상


https://github.com/chocoelf/aiffel_quest/assets/168162744/3a035c3b-c4cf-42ef-b8a1-7f73c854891b



