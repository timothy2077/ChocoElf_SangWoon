- **PRT(Peer Review Template)**
    - 코더 : 임상운
    - 리뷰어 : 서은재


- [O]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 잘 작동합니다~
```
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
```
    
- [O]  **2. 핵심적이거나 복잡하고 이해하기 어려운 부분에 작성된 설명을 보고 해당 코드가 잘 이해되었나요?**
    - 잘 이해되었습니다~
    
        
- []  **3. 에러가 난 부분을 디버깅하여 “문제를 해결한 기록”을 남겼나요? 또는 “새로운 시도 및 추가 실험”을 해봤나요?**
    - 기록은 남기지 않았습니다~


- [O]  **4. 회고를 잘 작성했나요?**
    - 네. 회고를 잘 작성해주셨습니다

```
막판에 완성해서 정신이 없습니다. 개념으로만 알고 있던걸 그래도 실제로 해봐서 많은 도움이 됬습니다.
```

- [O]  **5. 코드가 간결하고 효율적인가요?**
    - 필요한 부분들이 함수와 클래스 처리로 잘 정리가 되어 깔끔한 코드였습니다.

