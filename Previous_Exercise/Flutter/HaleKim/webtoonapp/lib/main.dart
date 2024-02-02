import 'package:flutter/material.dart';
import 'package:webtoonapp/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); //widget은 id같은 식별자 역할을 하는 key가 있다. - 그래서 flutter가 위젯을 빠르게 찾을 수 있다.(식별할 수 있다.)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
