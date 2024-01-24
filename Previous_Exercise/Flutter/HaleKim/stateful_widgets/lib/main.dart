import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  //stateless의 반대, 데이터가 변하는 위젯.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //stateful widget의 state는 위젯의 데이터와 UI를 저장하고, 데이터가 변경되면 위젯의 UI도 변경.
  // List<int> numbers = [];

  // void onClicked() {
  //   setState(() {
  //     //state에게 새로운 데이터가 있으니 동기화하라는 함수
  //     //setstate가 불려질때마다 build 함수가 다시 실행됨
  //     numbers.add(numbers.length);
  //     //데이터가 변경되는 코드를 꼭 setstate 안에 넣을 필요는 없으나 가독성을 위해 넣어두기.
  //   });
  // }

  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //앱 전체의 테마를 결정해주는 요소
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    //부모 요소의 데이터를 context로 받아와서 초기화해야할 때(구독할 때) 사용하는 함수
    //항상 build보다 먼저, 단 한 번만 호출돼야 함.
    super.initState();
  }

  @override
  void dispose() {
    //위젯이 사라질 때, 위젯 트리에서 제거될 때 사용하는 함수
    //이벤트 리스너 같은 것들을 구독 취소.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //context는 이전에 있는 모든 상위 요소(위젯 트리에서의)들에 대한 정보

    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context)
            .textTheme
            .titleLarge!
            .color, //null값에 접근하지 못하게 하기 위한 null safety 기능으로 인한 !나 ? 사용 -> 상위 요소가 null값이 분명히 아니다(!), null값일 수도 있으니 아니면 써라(?)
      ),
    );
  }
}
