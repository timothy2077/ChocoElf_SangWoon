import 'package:flutter/material.dart';

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
        '/one': (context) => OneScreen(),
        '/two': (context) => TwoScreen(),
      },
    );
  }
}

class OneScreen extends StatelessWidget {
  OneScreen({super.key});

  bool is_cat = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Icons.favorite, // 아이콘 이름
                color: Colors.red, // 아이콘 색상
                size: 50.0, // 아이콘 크기
              ),
              title: const Text('First Page'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () async {
                            is_cat = false;
                            final result = await Navigator.pushNamed(
                                context, '/two',
                                arguments: is_cat);
                            print('$result');
                          },
                          child: const Text("Next"))),
                  const SizedBox(
                      width: 300,
                      height: 300,
                      child: Image(
                        image: NetworkImage(
                            "https://flexible.img.hani.co.kr/flexible/normal/970/777/imgdb/resize/2019/0926/00501881_20190926.JPG"),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            )));
  }
}

class TwoScreen extends StatelessWidget {
  const TwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool is_cat = ModalRoute.of(context)?.settings.arguments as bool;
    print(is_cat);

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Icons.favorite, // 아이콘 이름
                color: Colors.red, // 아이콘 색상
                size: 50.0, // 아이콘 크기
              ),
              title: const Text('Second Page'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () {
                            is_cat = true;
                            Navigator.pop(context, is_cat);
                          },
                          child: const Text("Back"))),
                  const SizedBox(
                      width: 300,
                      height: 300,
                      child: Image(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-photo/cute-puppy_976589-177.jpg"),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            )));
  }
}
