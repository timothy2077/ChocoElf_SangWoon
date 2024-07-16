import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  TextEditingController urlController =
      TextEditingController(); // URL을 입력 받는 컨트롤러

  Future<void> fetchData() async {
    try {
      // 입력된 URL 가져오기
      final response = await http.get(
        Uri.parse(
            'https://46e8-14-53-96-51.ngrok-free.app/sample'), // 입력된 URL 사용
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result =
              "predicted_label: ${data['predicted_label']}\nprediction_score: ${data['prediction_score']}";
          print(data['predicted_label']);
        });
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }
  
    Future<void> fetchData2() async {
    try {
      // 입력된 URL 가져오기
      final response = await http.get(
        Uri.parse(
            'https://46e8-14-53-96-51.ngrok-free.app/sample'), // 입력된 URL 사용
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result =
              "predicted_label: ${data['predicted_label']}\nprediction_score: ${data['prediction_score']}";
          print(data['prediction_score']);
        });
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Jellyfish classifier'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.shower),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.network(
              'https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Fc09f8228-29c7-4dcb-8ca3-1de7d3988fab%2Fc6e2d675-510e-4c34-a565-6a1c575c0042%2Fjellyfish.jpg?table=block&id=18d9f375-e76a-4c1d-b14b-c9becd680b9e&spaceId=c09f8228-29c7-4dcb-8ca3-1de7d3988fab&width=2000&userId=d57623ee-65df-4a7e-94a7-30f9bc3b4697&cache=v2'),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(Icons.play_arrow), onPressed: fetchData),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: fetchData2

                      
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

'''회고 
막판에 완성해서 정신이 없습니다. 개념으로만 알고 있던걸 그래도 실제로 해봐서 많은 도움이 됬습니다.'''
