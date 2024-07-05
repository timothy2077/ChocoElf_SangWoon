import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.catching_pokemon, size: 50),
              backgroundColor: Colors.blue,
              title: Center(child: Text('플러터 앱 만들기')), //중앙정렬?
            ),
            body: Column(
              children: [
                Expanded(
                    child: Center(
                  child: ElevatedButton(
                    child: Text("Text"),
                    onPressed: () {
                      print("버튼이 눌렸습니다. ");
                    },
                  ),
                )),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      alignment: Alignment(0, 0),
                      width: 300,
                      height: 300,
                      color: Colors.grey,
                    ),
                    Container(
                      width: 240,
                      height: 240,
                      color: Colors.red,
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      color: Colors.purple,
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.yellow,
                    ),
                    Container(
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
