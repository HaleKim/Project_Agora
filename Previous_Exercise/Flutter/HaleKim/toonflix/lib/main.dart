import 'package:flutter/material.dart';

void main() {
  runApp(App()); //widget 형 자료를 인수로 받는 함수
} //flutter의 모든 요소들은 widget이다. 레고 블럭과 같이 생각.

class App extends StatelessWidget {
  //main의 runapp에 들어가있으므로 App이 root.
  //그냥 class인 App을 widget으로 만들어주기위해 core widget 중 하나인 statelesswidget 상속.
  @override
  Widget build(BuildContext context) {
    //뭐든 입력받아 화면에 띄워줌. widget들을 받아 ui로 띄워줌(return)..
    //widget을 사용하기 위해서는 반드시 build method를 구현해야함.
    return MaterialApp(
      home: Scaffold(
        //home 화면에 대한 정의
        //scaffold는 화면의 기본 골자.구성 및 구조가 되는 class
        appBar: AppBar(
          //맨 위의 바
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text('Hello flutter!'),
        ),
        body: const Center(
          //center:child들을 가운데로 오게 해주는 widget
          child: Text('Hello world!'),
        ),
      ),
    ); //Material은 google, cupertino는 apple
  } //모든 것은 widget. widget 안에 widget.. 그리고 widget은 class.
}
