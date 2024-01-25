import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer; //timer를 사용하기 위한 timer 객체 선언, late로 나중에 초기화

  void onTick(Timer timer) {
    //timer함수 안에 넣을 함수는 timer를 인수로 받아야 한다.
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }
  //timer에서 duration마다 실행될 함수.

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1),
        onTick /*괄호는 넣지 않는다. 타이머가 duration마다 괄호를 넣어서 함수를 실행해 줄 것이기 때문.*/);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel(); //timer를 멈추는 함수
    setState(() {
      isRunning = false;
    });
  }

  String format(int gotseconds) {
    var duration = Duration(seconds: gotseconds); //duration 클래스로 정수를 초단위로 변환
    return duration.toString().split('.').first.substring(2, 7);
  }
  //시간 나타내는 포맷

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            //UI의 비율을 설정해주는 클래스
            flex: 1, //default
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          //first flexible
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ),
          //second flexible
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  //row로 감싸고 expanded로 감싸면 container가 가로로 끝까지 확장
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      // borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                              fontSize: 58,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //third flexible
        ],
      ),
    );
  }
}
