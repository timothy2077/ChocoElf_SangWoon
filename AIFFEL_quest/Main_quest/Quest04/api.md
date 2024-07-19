# main_api
```
import uvicorn   # pip install uvicorn 
from pydantic import BaseModel # pip install fastapi 
from fastapi.middleware.cors import CORSMiddleware
from fastapi.encoders import jsonable_encoder
import logging
import tensorflow as tf
import os
import requests
from fastapi import FastAPI, HTTPException
from PIL import Image
import numpy as np
from fastapi import FastAPI, HTTPException, UploadFile, File
import tensorflow_hub as hub
import numpy as np
from io import BytesIO   # pip install uvicorn 
from fastapi.responses import JSONResponse
import uuid
import json
# Create the FastAPI application
app = FastAPI()

# CORS configuration
origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class Item(BaseModel):
    imageUrl: str = None
    style_image_url: str = None

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

count = 1

model = hub.load('https://tfhub.dev/google/magenta/arbitrary-image-stylization-v1-256/2')

# 이미지 스타일 전이 함수
def style_transfer(content_image, style_image):
    # 이미지 전처리
    content_image = tf.image.convert_image_dtype(content_image, tf.float32)
    style_image = tf.image.convert_image_dtype(style_image, tf.float32)

    # 스타일 전이 적용
    outputs = model(tf.constant(content_image), tf.constant(style_image))
    stylized_image = outputs[0]

    # 이미지 후처리
    stylized_image = tf.image.convert_image_dtype(stylized_image, tf.uint8)
    stylized_image = Image.fromarray(stylized_image.numpy())
    return stylized_image

@app.post('/uploadAndTake')
async def upload_image_url(item: Item):
    global count
        
    # 여기서 이미지 처리 로직을 수행하고, 예시로 단순 카운트 증가
    count += 1
    try:
        # 입력 이미지 URL로부터 이미지 다운로드
        response_content = requests.get(item.imageUrl)
        content_image = Image.open(BytesIO(response_content.content))

        # 스타일 이미지 URL로부터 이미지 다운로드
        response_style = requests.get(item.style_image_url)
        style_image = Image.open(BytesIO(response_style.content))

        # 이미지 스타일 전이 적용
        stylized_image = style_transfer(np.array(content_image), np.array(style_image))

        # 스타일 전이된 이미지를 파일로 저장하여 클라이언트에게 반환
        save_path = "./stylized_image.jpg"
        stylized_image.save(save_path)
        
        # 파일을 클라이언트에게 반환
        return {'save_path': save_path}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to perform style transfer: {str(e)}")

# Run the server
if __name__ == "__main__":
    uvicorn.run("main_api:app",
            reload= True,   # Reload the server when code changes
            host="127.0.0.1",   # Listen on localhost 
            port=5000,   # Listen on port 5000 
            log_level="info"   # Log level
            )
```

# main.dart
```import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}

class Photo {
  String id;
  String url;
  String title;

  Photo(this.id, this.url, this.title);
}

class MyRoutePath {
  String? id;

  MyRoutePath.home() : id = null;

  MyRoutePath.detail(this.id);
}

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {

  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return MyRoutePath.detail(remaining);
    } else {
      return MyRoutePath.home();
    }
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath configuration) {
    if (configuration.id != null) {
      return RouteInformation(location: '/detail/${configuration.id}');
    } else {
      return const RouteInformation(location: '/');
    }
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  String? selectId;
  String? url;
  String? title;

  
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  MyRoutePath get currentConfiguration {
    if (selectId != null) {
      return MyRoutePath.detail(selectId);
    } else {
      return MyRoutePath.home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomeScreen(_handleOnPressed)),
        if (selectId != null) MaterialPage(child: DetailScreen(id: selectId, url: url, title: title))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        selectId = null;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    if (configuration.id != null) {
      selectId = configuration.id;
    }
  }

  void _handleOnPressed(Photo data) {
    selectId = data.id;
    url = data.url;
    title = data.title;
    notifyListeners();
  }

}


typedef PhotoCallback = void Function(Photo data);

class HomeScreen extends StatelessWidget {
  final PhotoCallback onPressed;

  List<Photo> dummyPhotos = [Photo('1', 'https://images.unsplash.com/photo-1720831992796-dfce4a96e885?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzNXx8fGVufDB8fHx8fA%3D%3D', '해질녘 배 한 척이 바다에 떠있습니다.'),
                            Photo('2', 'https://plus.unsplash.com/premium_photo-1720885652263-17b2be207129?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzN3x8fGVufDB8fHx8fA%3D%3D', '물 가운데에 있는 큰 암석')];

  HomeScreen(this.onPressed, {super.key} );

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.blue,
        title: const Center(child: Text('photo_gallaery')),
        leading: IconButton(
          icon: const Icon(Icons.collections), // 왼쪽에 메뉴 아이콘을 추가합니다.
          onPressed: () {
              // 메뉴 클릭 시 실행할 동작 추가
            },
          ),
      ),
      body: GridView.builder(
        itemCount: dummyPhotos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onPressed(dummyPhotos[index]),
            child: Card(
              child: Image.network(
                dummyPhotos[index].url,
                fit: BoxFit.cover, // 이미지가 카드에 맞게 조정되도록 설정
              ),
            ),
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String? id;
  final String? title;
  final String? url;

  const DetailScreen({
    required this.id,
    required this.title,
    required this.url,
    super.key,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  
  String? result;
  final String apiUrl = 'https://fdec-14-53-96-51.ngrok-free.app/uploadAndTake'; // 패스트API의 엔드포인트 URL로 대체하세요

  Future<void> postData() async {
    
    try {
      var response = await http.post(Uri.parse(apiUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonEncode({
        'imageUrl': widget.url,
        'style_image_url': 'https://cdn.imweb.me/upload/S2017101359e025984d346/9c29fa134989d.jpg',
      }));

      if (response.statusCode == 200) {
        print('요청 성공: ${response.body}');
        // 여기서 필요한 추가 작업 수행
      } else {
        print('요청 실패: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Photo ${widget.id}',
          style: const TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Column(
            children: [
              Text(widget.title ?? 'null'),
              Image.network(widget.url ?? 'null'),
              ElevatedButton(
                onPressed: postData, 
                child: const Text('이미지 변환하기')),
              Image.network(result ?? 'null')
            ],
          ),
        ),
      ),
    );
  }
}
```

회고 : 하아 완성된 영상은 없습니다. 와이어프레임 짤 시간도 없었습니다. 완성하고나서 할려고 했는데 완성을 못했습니다.
진짜 ㅠ_ㅠ 하아 ㅠ_ㅠ 죄송합니다. 생각보다 서버와의 통신이 쉽지 않았습니다. URL로 보낼려고하면 문제가 생기고 그래서 이미지로  
보낼려고했더니 인코딩 디코딩이 어렵고 그래서 저장해서 불러오려고 했더니 저장이 안됩니다. 정말 끔찍합니다.  
마지막에는 화면 오류도 나고 버튼이 하나씩 안되기 시작하더니... 심지어 프로젝트를 초기화하는 사태를 가져왔습니다. 하아...ㅠ_ㅠ  
정말 맘같지 않습니다. 죄송합니다. ㅠ_ㅠ
